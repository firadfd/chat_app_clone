import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/constants/app_colors.dart';
import '../utils/custom_widgets/ui_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      final status = await Permission.photos.status;

      if (status.isGranted) {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            _imageFile = File(pickedFile.path);
          });
        }
      } else {
        if (await Permission.photos.request().isGranted) {
          final pickedFile = await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            setState(() {
              _imageFile = File(pickedFile.path);
            });
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permission denied')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back), // Added const
        ),
        title: UiHelper.customText(text: "Your Profile", context: context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.customButton(
        text: "Save",
        callback: () {
          // Implement your save logic here
          if (firstnameController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('First name is required')),
            );
            return; // Don't proceed if first name is empty
          }
          //TODO
        },
      ),
      body: Center(
        child: SingleChildScrollView( // Added for scrollability
          padding: const EdgeInsets.all(20.0), // Added padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector( // Wrap with GestureDetector
                    onTap: _pickImage, // Call _pickImage on tap
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: _imageFile == null
                          ? Icon(
                        Icons.person,
                        size: 60,
                        color: Theme.of(context).brightness ==
                            Brightness.dark
                            ? Colors.white
                            : Colors.black45,
                      ) : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(_imageFile!),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: _pickImage,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              UiHelper.customTextField(
                controller: firstnameController,
                text: "First Name (Required)",
                textInputType: TextInputType.text,
                context: context,
              ),
              const SizedBox(height: 30),
              UiHelper.customTextField(
                controller: lastnameController,
                text: "Last Name (Optional)",
                textInputType: TextInputType.text,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}