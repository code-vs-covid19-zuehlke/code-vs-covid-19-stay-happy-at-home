package org.codevscovid19.stayhappyathome.service;

import com.google.cloud.storage.Storage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gcp.storage.GoogleStorageResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.net.URL;

@Service
public class PhotoService {
  private static final String STORAGE_CLOUD_GOOGLE_COM = "storage.cloud.google.com";
  private static final String HTTPS = "https";
  private final Storage gcStorage;
  private final String bucketName;

  @Autowired
  public PhotoService(Storage gcStorage, @Value("${spring.cloud.gcp.photo-bucket}") String bucketName) {
    this.gcStorage = gcStorage;
    this.bucketName = bucketName;
  }

  public URL writeBytesToStorage(String id, byte[] bytes, String photoContentType) throws IOException {
    GoogleStorageResource resource = new GoogleStorageResource(gcStorage, "gs://" + bucketName + "/" + id);
    try (OutputStream os = resource.getOutputStream()) {
      os.write(bytes);
    }

    resource.getBlob().toBuilder()
      .setContentType(photoContentType)
      .build().update();

    URI uri = resource.getURI();
    // transforming gs://bucket-name/id --> https://storage.cloud.google.com/bucket-name/id
    return new URL(HTTPS, STORAGE_CLOUD_GOOGLE_COM, "/" + uri.getHost() + uri.getPath());
  }
}
