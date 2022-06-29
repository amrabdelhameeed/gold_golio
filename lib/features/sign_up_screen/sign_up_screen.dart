import 'package:flutter/material.dart';
import 'package:gold_golio/core/app_images.dart';
import 'package:gold_golio/core/app_strings.dart';
import 'package:gold_golio/core/app_styles.dart';
import 'package:gold_golio/shared/widgets/default_text_form_field.dart';

class ChoosingTalentsScreen extends StatelessWidget {
  ChoosingTalentsScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(AppImages.logo, height: size.height / 4)),
              SizedBox(
                height: size.height / 20,
              ),
              const Text(
                AppStrings.personalInfo,
                style: AppStyles.kBigTextStyle,
              ),
              SizedBox(
                height: size.height / 30,
              ),
              DefaultTextFormField(
                  hint: 'Full Name', controller: nameController),
              DefaultTextFormField(
                  hint: 'Email Address or Phone Number',
                  controller: emailOrPhoneController),
              DefaultTextFormField(
                  hint: 'Password',
                  isPassword: true,
                  controller: passwordController),
              DefaultTextFormField(
                  hint: 'Gender', controller: genderController),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.amber.shade300),
                    onPressed: () {},
                    child: Text(
                      AppStrings.next,
                      style: AppStyles.ksmallTextStyle
                          .copyWith(color: Colors.white, fontSize: 30),
                    )),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Center(
                child: Row(
                  children: [
                    const Text(
                      AppStrings.alredyAMember,
                      style: AppStyles.ksmallTextStyle,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.login,
                          style: AppStyles.ksmallTextStyle
                              .copyWith(color: Colors.grey.shade600),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
