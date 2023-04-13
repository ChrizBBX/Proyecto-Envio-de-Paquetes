import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/index_screen.dart';

class LoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration:  BoxDecoration(
image: DecorationImage(
  image: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0ICAcIDQ0NCAcHBw0HBwcHDQ8ICQcNFREWFhURExMYHSggGBolGx8TITEhJSkrLi4uFx8zODMsNygtLisBCgoKDQ0NFQ0NFSsdFR0rKysrLSsrLSs3KysrKysrKysrLSsrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIASsAqAMBIgACEQEDEQH/xAAXAAEBAQEAAAAAAAAAAAAAAAAAAgEF/8QAFhABAQEAAAAAAAAAAAAAAAAAABES/8QAGgEBAQEAAwEAAAAAAAAAAAAAAAMBAgYHBP/EABcRAQEBAQAAAAAAAAAAAAAAAAAREgH/2gAMAwEAAhEDEQA/AOFGRTY9Hrs2kxkWQppMI1sKaTCKIU0mEUQppMZFkKaTCKIU0mEVCFNJhFQKaTCKCmkwVGFNLhFRidQ0yEVCFNJhFRhTTIRUZCmmQioQppMIqEKaTCKhCmkwioQppMIqMhTTIRUIU0mDWlNKhGxsTqGkwiowppkI2NhTSYRsbCmkwjY2FNJhGthTSYRrYU0mEbGwppMI1sKaTCNbCmkwbAppUbFQidR0iNVCFNIjVQhTSI2KhCmkRsVCFNIjYqEKaRCLhCmkxkXGQppMIuEKaTGRcIU0mMXAppsIoTqGkwigppMIoKaTCKCmkwigppMIoKaTCKCmkwigppMIoKaTCKCmkxrQppcYqETqGkwVCFNJhFQhTSYRUIU0mEVCFNJjY2EKaTGxsIU0kioQppMIqEKaS2NhCmkioFNKhFQiWkNJhFQhTSYRUIU0mEVCFNJhFQho0mEVCFNJhFQhTSYRUIU0mEVCGjSYRUIU0mNbA0aVCKhE6hpMIqEKaTCKhCmkwioQppMIqEKaTCKhCmkwioQppMIqEKaTCKhCmkwioQppMFQKaVCKgnUNJhFBTSYRUCmkwioF6aTCKgU0mEUFNJhFEKaTCKCmkwigppMIqBTSYKgU0qEVCJVHSYRUIU0mEVCFNJhFQhTSYRUIU0mEVCFNJhFQhTTIyKhCmmRkVCFNJhFQhTSYKgU0qEVBOoaTCKgU0mEVAppMIoKaTCKgU0mEUFNJhFQhTSYRQU0mEUQppMIohTSYKCmlQioROoaTCKhCmkwioQppMIqEKaTCKhCmkwioQppMIqEKaTCKhCmkwioQppMIqEKaTBUCmlQioRwqOkwioQppMIqEKaTCKhCmkwioQppMIqEKaTCKhCmkwioQppMIqEKaTCKhCmkwVAppUIqESr59JhFQhTSYRUIU0mEVCFNJhFQhTSYRUIU0mEVCFNJhFQhTSYRUIU0mEVCFNJgqBTSoRUInUNJhFQhTSYRUIU0mEVCFNJhFQhTSYRUIU0mEVCFNJhFQhTSYRUIU0mEVCFNJgqBTSoRUE6jpMIoKaTCKCmkwigppMIoKaTCKCmkwigppMIoKaTCKCmkwigppMFBTSoRUInUNJIqEZTSSKhG00kioRlNJhFQjaaTCKhGU0kioRtNJhFQjKaTCKhG00mEVCMppMFQKaVGRcI4VDSckVCFNJhFQhTScsi4QppMIqEKaTlkXCFNJhFQhTSckVCFNJhFRhTTIZVCFNJjFwKaUNEqjWDQpWDQpWDQpWDQpWDQpWDQpWDQpWDQpWDQpWDQpX//Z'),

  fit: BoxFit.cover
),
        ),
        child: Center(
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Text('Sign In')
           ],
          ),
        ),
      ),
    );
  }
}