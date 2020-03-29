package org.codevscovid19.stayhappyathome.service;

import com.google.cloud.storage.Storage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gcp.storage.GoogleStorageResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;

@Service
public class PhotoService {
  private static final String STORAGE_CLOUD_GOOGLE_COM = "storage.googleapis.com";
  private static final String HTTPS = "https";
  private final Storage gcStorage;
  private final String bucketName;

  @Autowired
  public PhotoService(Storage gcStorage, @Value("${spring.cloud.gcp.photo-bucket}") String bucketName) {
    this.gcStorage = gcStorage;
    this.bucketName = bucketName;
  }

  public URL writeBytesToStorage(String id, byte[] bytes, String photoContentType) throws IOException {
    GoogleStorageResource resource = getResource(id);
    try (OutputStream os = resource.getOutputStream()) {
      os.write(bytes);
    }

    setContentType(photoContentType, resource);

    return getUrl(resource);
  }

  private void setContentType(String contentType, GoogleStorageResource resource) throws IOException {
    resource.getBlob().toBuilder()
      .setContentType(contentType)
      .build().update();
  }

  /**
   * transforming gs://bucket-name/id --> https://storage.cloud.google.com/bucket-name/id
   */
  private URL getUrl(GoogleStorageResource resource) throws MalformedURLException {
    URI uri = resource.getURI();
    return new URL(HTTPS, STORAGE_CLOUD_GOOGLE_COM, "/" + uri.getHost() + uri.getPath());
  }

  private GoogleStorageResource getResource(String id) {
    return new GoogleStorageResource(gcStorage, "gs://" + bucketName + "/" + id);
  }
}
