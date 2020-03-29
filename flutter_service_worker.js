'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "49006c53c1df0e160c78b133f12c58c4",
"/main.dart.js": "f36c9f6ffcdd76444b4012fa98d257ca",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "062489acaab5aac6d97c183925512037",
"/assets/LICENSE": "0f07613d27e6a605645c3e14a0d4cb13",
"/assets/AssetManifest.json": "0b7415f7cdbd94f744a6d22f93788d71",
"/assets/FontManifest.json": "d284a9da03d8cc1fe21e930832dcd9de",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/Comfortaa-VariableFont_wght.ttf": "f40889caa25956ef4d27c2aadc4fbe13",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/emoji/hear_no_evil_monkey.png": "a0bd8381fb987ce838058714f3405edd",
"/assets/assets/emoji/sleeping_face.png": "49be611c754b0884aef3221f20fe07a5",
"/assets/assets/emoji/thinking_face.png": "25fac3c82e1db480db166db47f908042",
"/assets/assets/emoji/yawning_face.png": "c409697134bd1a8cb96c97341694b007",
"/assets/assets/emoji/drooling_face.png": "d9f2c320025c252a4a88fea02f827750",
"/assets/assets/emoji/person_lifting_weights.png": "88a65890480b8edb762542987c71044b",
"/assets/assets/emoji/panda.png": "d4c7da8ee306e9aa75993a6e907bf08f",
"/assets/assets/emoji/nerd_face.png": "cdc32be6d82b5979a94be1abd2103fa9",
"/assets/assets/emoji/face_screaming_in_fear.png": "f0a24a66a658c5af031b93ad43e60319",
"/assets/assets/emoji/pile_of_poo.png": "be926769e1a291cf9070083a70fa6944",
"/assets/assets/emoji/smiling_face_with_heart_eyes.png": "d81af2a0c09ba90c3e0908a6f710bece",
"/assets/assets/emoji/unamused_face.png": "b5542ad9ccbc84bee752cdae37720448",
"/assets/assets/emoji/face_with_tears_of_joy.png": "4d798ce828f80ac2cc1fba0cc91a9ab1",
"/assets/assets/emoji/loudly_crying_face.png": "8452786eed51c9323d299e0177a61d35",
"/assets/assets/emoji/pouting_face.png": "f2432cf15a583e3547965113bd88b0e8",
"/assets/assets/emoji/face_with_medical_mask.png": "154dd783967ce2ad38381dbaea2d8fb2",
"/assets/assets/emoji/exploding_head.png": "c16ab457d13e291a32759af8f0709493",
"/assets/assets/emoji/grinning_face_with_smiling_eyes.png": "469cbabd6ed1b69b1836d041df1c49c3",
"/assets/assets/emoji/person_in_lotus_position.png": "541542e78f963312ada158011190d1f9",
"/assets/assets/emoji/downcast_face_with_sweat.png": "52a91ec93d6dd15c60124bd93cc37abf",
"/assets/assets/profile_picture.jpg": "495d555b254371ef41eaad0bc3cd7d48"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
