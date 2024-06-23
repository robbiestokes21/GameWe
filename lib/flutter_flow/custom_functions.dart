import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? generateFileName(String? baseName) {
  final DateTime now = DateTime.now();
  final String timestamp = now.microsecondsSinceEpoch.toString();
  return '${baseName}_$timestamp.jpg'; // Ensure the file extension is appropriate
}

String? generateUID() {
  // create a uuid
  final String uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
      .replaceAllMapped(RegExp('[xy]'), (Match match) {
    final String char = match.group(0)!;
    final int random = math.Random().nextInt(16);
    final int value = char == 'x' ? random : (random & 0x3 | 0x8);
    return value.toRadixString(16);
  });
  return uuid;
}

String createPostID() {
  // create a random 6 string for a postID
  final String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final math.Random rnd = math.Random();
  String result = '';
  for (int i = 0; i < 6; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

String? extractAuthCode() {
  // Extract code from the URL on page load
  final Uri uri = Uri.base;
  return uri.queryParameters['code'];
}

String? extractToken() {
  // Extract code from the URL on page load
  final Uri uri = Uri.base;
  return uri.queryParameters['access_token'];
}
