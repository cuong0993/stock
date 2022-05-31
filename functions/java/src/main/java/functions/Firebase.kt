package functions

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.firestore.FirestoreOptions

val db = FirestoreOptions.getDefaultInstance().toBuilder()
    .setCredentials(GoogleCredentials.getApplicationDefault())
    .build().service