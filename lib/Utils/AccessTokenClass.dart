import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';

import '../Utils/Strings.dart';

class AccessTokenClass {
  static const String firebaseMessageScope = "https://www.googleapis.com/auth/firebase.messaging";


  Future<String?> obtainAuthenticatedClient() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
        // {
        //   "type": "service_account",
        //   "project_id": "locksee-prod",
        //   "private_key_id": "6c9ae5cdbf41f9bda4e5d75b5ec053ec9fa68673",
        //   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDZLxYTwIzfMPei\nxZnCgHA8KLkhfbZXE5EnIo2/K85iZSzpkjilbiFRvYjJCBfDxPjdN9FjVjwAzzZL\nhLtyQtogguI+vZfJjTJLi18lyyggzmI9NEzC9f+lIhc1MOKNJFTVSZLPRMw+qalr\nRIBw2hlPZIH1eq7VfFz9jl6Tr+8SauXE6oWXqetF5UDoQsbXYHaOu740umlex1xj\nvrP0zW5RhfIwrz6TFLnYBgJlHCH/SJWMw9bSSMPrm23cpkzxsiBSL1a+Lt0Gkuob\nF75e6bN68lxLZ2tsbXLK5B5MR3W8Off1BGRWRtrKKEr2iC6boU917j8nEeKoCgiT\nqwj2+gHdAgMBAAECggEABZQ3kXdTRxJ3cgd4bS4mc+0p4End6ru2cVZqZLxH13A4\n6KEYcmtzUKm5P0zFa4J+UBR0fQREk1K/Vs5IkGVWPBqQnEL7iLJnVdh1L7/Zvon+\nrQrQY/u0vvWyueuRDkYeJcJ3knp2cq+iCf7e+8cmeksfKYKmxhYlP2AuXsXYstTf\nBzuChbiF2La6Dxitbas9/OjKfk7tvJ0+uWVDNoUToxWPjj/JmY9Cc2k1bbZ1TMNL\nn4TbHtVmQ6W3nDX+GXx8HzyP3cvP16JNIxUrle2e5P3MrKOjndPndFiY83pOsuZq\npt6lJwhlJo9GQyZfleoZ26QFTUBExzjwezcvNxumkQKBgQDnBzgntrOaoSosVEwt\nGvn+Kb0NBKeRlPOYvYD24OjRtbB4TtHnb8eRDB0JCbsE717iStKBH98zXXQqUMcx\ng4CkN+y7djOafz9ii5GrHlupWb+qS38LeupehIHTI1aqwX7fJShEyXBKxOyTD1ea\nVCRxZUlcIwKmVtkhaFGeW3FCeQKBgQDwqMg5pwTTr9IAJvkujde79sgxInnIk1Ci\nLIQNP6S4kGYk1M+Z/kuPpFlftUQ4LAfADygOgIhESbox14H/JlSE4302Lhp87fKf\nmrrQ3Hca1vYSkdd07ux+Jkpf1EcP/ChsU+Hl94D/pHSxhyP/hEj43hnorUvUJ5GC\nQE8WKuABhQKBgHIrVCn0FO/ug0vi4L5NnYtoDwAW88RzCqrJw6i9XvD7y9i4guzP\nhZz9kn+76ks3C/nipgKfwIq+vUCIKNgkN3dwF7JQaJIKHkXR2UvqNbwMGTbMFl2T\nAa1x6EJyLUs3Uj5uO2c68R5SEONf6pfeyx+qwUUiHBYdxzHGPsd2QxNpAoGAbDPW\n4mT/vJW+m6bqPk40AyTv2XegvdfOVzwgmzxUOU9jPYgZVymIm6rPLEL5yy+wxF+M\nKQkNO3bSqno0zp1TPvRxZZzQ9/6cKbqN6D5Xps+jj7HW55JM7mMU6YUt9jfvjNUi\nKh1f+JDejrsuKkI19P8XMxBHmbm4qJF1fYgFc2kCgYBKCiL3qeDaDX96dH9yAcSd\nn67Ekk+EKBX526UtnL/xRxnvsUvs322ojHc7OO7n8B8V+VsNuQgpUGTpy0VyEQy+\n/qEWB7uFynaWIhaXITLjrKFTuCUPrN3WN0ErLDl2HcuAfzuXoFRNv2hMkANVvi3I\n7+IybhtovtsZ3wwtwYN9Yg==\n-----END PRIVATE KEY-----\n",
        //   "client_email": "firebase-adminsdk-cvra2@locksee-prod.iam.gserviceaccount.com",
        //   "client_id": "111089969052128386312",
        //   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        //   "token_uri": "https://oauth2.googleapis.com/token",
        //   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        //   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-cvra2%40locksee-prod.iam.gserviceaccount.com",
        //   "universe_domain": "googleapis.com"
        // }

        {
        "type": "service_account",
        "project_id": "group108-39c17",
        "private_key_id": "766dbdb58fbce18f2b32d12da41328fa81c85611",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDKmLItsRnSCA9T\nF6QZvknxaDeb8gti/zS/q1/1P5aCZWshg1m0cMIeR8hAKiryEy6A/iCk4/vbo6zn\nWTr0U8ol7uR2d7WwzPxVxdEagodVeCUjxXaN77WEXhqPdr04pv5mDqvVzcEnAApJ\nHA8oYbd8737ezSlkcaMqlRhyTMQ+++xp6zDvbTXXrzNDHDmqo42uKIW+l27cCUc+\n8AXMiLCWudm/1+osCnLmppdC1yR+5nOonrbPu79elmVGUNDYrfoFywV9ojwaLhPU\nVHI7aCHKH9iP+OxdKMX5j79+TexIgXpyLPWgJoG7XerSntm1JAHRlRHXAXiqeA+Q\nPmlnXO5pAgMBAAECggEAHLJiUqyKTsDLguaPXQIiMSqk7dbsG/qwOxIIRpHaPOAm\nu5mCZFewd1+NkuEmMiHbbXQRpamRbDwT6rUt75vKv3LGM62jM8blWzTo+ItSph2d\njSKUN2ij2nsF4hpclSC6WjRrzJ4XZPHRgyeRUhP9TJoT63U+Drc1+Hsj+lS7W3xM\n0/z5exTadIFpq4d2gB81ElQEhFDAnBl/sJfUqBeUc3lTNadEFhxiZ8p1tnkBjMEx\nlpbGcpW9UCbA3anEhXg0xnMtmYE1N7dkK/HIUrj8ou+5JUFl6O+rrvPlM0aKqCRO\nNPpk6Mv4UR3mVv95n0dhQv4SA10YLC8eWhkiGwev/QKBgQD8qE1qXO0mUq2dhD+U\n6L9MfHZ4JJpK1ryyuI/enHW+iUNqgmVCE2Aq6qdG3ydn3dMWTT7z7NIMjH4Ag4KH\n4nopc9wun2RsyE2Y3qzqkP+RIBzVe0uP7NDboQalQ/PBu7otebV/wxkZtijubt4K\n85zWGSh4i4pHV17JzCfOneJQTwKBgQDNRtj/ruxXg5NoqIVHJNjVE40ThX3Rg3ZW\nh1OSKYgbQGdw806Xu40eJRBJqZM4pqAxRE82wZgnwFx7QKatzirtl0G1LWvRAQ8B\nnDj3F3DF8g+yAQ4D0uN+nJuhUwp/Tbzk+AJCkIBKSiTsXr07qlzvXvtdxWHAFaYD\nIh0NVq4vxwKBgAwlz2sQwro3+W78X846DpCP32ZRZDW682GobApo/WRG1z30vQeb\nROFrXNWUfyGIUdDdr+wsc8D0tE40BH+iDPuXPXvkYAC29Lwn4Kp6hD8nCxvcjLqD\nyVr1+ArUJJEpBH+RPX/CEp/g2UD1hamDIwRMO1zoYKKjecQ8E6Hkh3ATAoGAeb/p\neExxVL5vMYWx9q4+BLKh29Ay/Y6xI0UEJg6H8VHTiERmesv8OMLW1DnFXbZGELJp\nIRrVec43i8qekTtUbrJlgGW+KqosElJr3vGCK4UUFglWHKJ512BfVeGAulyLCmqm\nPICj9mvfVmoiZj72++ojwEwPW/P7EKStAnpEuYUCgYEA7jxTlcEJ2ppTPG2O3c6A\nWirS1fnEFRbNsCw12wgwQOhC9nixHUkf5rIOxpfW4zHSjcoa6seerqRO4byMqIso\njcYzQvAIo6w94jkhrTJqXL0P4one4wE+hXvi9HKRxJdjAhcvBZ2Np3v0Dbyz9d+b\no2VtQ0kGD8+BXmSJmGPlJAc=\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-fbsvc@group108-39c17.iam.gserviceaccount.com",
        "client_id": "113509611740714969447",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40group108-39c17.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
        }











    );


    final scopes = [firebaseMessageScope];

    try {
      AuthClient client = await clientViaServiceAccount(accountCredentials, scopes);
      final accessToken = client.credentials.accessToken.data;


       print("Access Token: $accessToken");

      //  await storageService.saveFcmAccessToken(accessToken);
//

      // Strings.accessToken = accessToken ?? "";
      //
      // print("Access Token: ${Strings.accessToken}");


      return accessToken;
    } catch (e) {
      print('Failed to obtain access credentials: $e');
      return null;
    }
  }



}
