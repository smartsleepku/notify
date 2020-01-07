package dk.ku.sund.notify.config

import com.google.auth.oauth2.GoogleCredentials
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import java.io.FileInputStream

private val secretRoot = "/run/secrets"

fun initializeFcb() {
    val serviceAccount = FileInputStream(secretRoot + "/firebase-adminsdk.json")
    val credential = GoogleCredentials
        .fromStream(serviceAccount)
        .createScoped(listOf("https://www.googleapis.com/auth/firebase.messaging"))
    val options = FirebaseOptions.Builder()
        .setCredentials(credential)
        .setDatabaseUrl("https://smartsleep-cdc62.firebaseio.com")
        .build()

    FirebaseApp.initializeApp(options)
}
