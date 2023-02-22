import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';

import '../../../../core/resource/routes_manager.dart';
import '../../../../core/resource/validator.dart';
import '../../../components/core_components/custom_text_form_faild.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> items = [
    "Male",
    "Female"
  ];
  final List<String> status = [
    "married",
    "singles "
  ];
  String? selectedValue;
  String ?selectStatusValue;
  String ? nationality;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: ColorManage.primaryBlue,
    //   body: SingleChildScrollView(
    //     child: SafeArea(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           SizedBox(
    //             height: 20.h,
    //           ),
    //           Row(
    //             children: [
    //               IconButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   icon: Icon(
    //                     Icons.arrow_back,
    //                     color: ColorManage.primaryYellow,
    //                     size: 36.sp,
    //                   )),
    //               SizedBox(
    //                 width: 75.w,
    //               ),
    //               Center(
    //                   child: Text("Join With Us",
    //                       style: getSemiBoldStyle(
    //                           color: Colors.white, height: 1, fontSize: 28.h))),
    //             ],
    //           ),
    //           Container(
    //             height: 720.h,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.only(
    //                   topRight: Radius.circular(40.r),
    //                   topLeft: Radius.circular(40.r),
    //                 ),
    //                 color: Colors.white),
    //             child: SafeArea(
    //               child: Form(
    //                 key: formKey,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     SizedBox(height: 20.h),
    //                     //email falid
    //                     CustomTextField(
    //                       iconData: FaIcon(Icons.email),
    //                         controller: emailController,
    //                         hint: 'Email',
    //                         fieldValidator: emailValidator),
    //                     SizedBox(height: 10.h),
    //                     CustomTextField(
    //                         iconData: const FaIcon(FontAwesomeIcons.idCard),
    //
    //                         controller: userNameController,
    //                         hint: 'Name',
    //                         fieldValidator: (String ? value){
    //                           if(value!.isEmpty || value == null){
    //                             return "this field is Required";
    //                           }
    //                         }),
    //                     SizedBox(height: 10.h),
    //
    //                     //password's
    //                     BlocConsumer<AuthCubit, AuthState>(
    //                       listener: (context, state) {
    //                         // TODO: implement listener
    //                       },
    //                       builder: (context, state) {
    //                         return CustomTextField(
    //                           iconData: FaIcon(FontAwesomeIcons.lock),
    //
    //                           fieldValidator: passwordValidator,
    //                           controller: passwordController,
    //                           hint: 'Password',
    //                           password: AuthCubit.get(context).visibility,
    //                           passwordTwo: true,
    //                           function: () {
    //                             AuthCubit.get(context).changeState();
    //                           },
    //                         );
    //                       },
    //                     ),
    //                     SizedBox(height: 30.h),
    //                     //sign in button
    //                     BlocBuilder<AuthCubit, AuthState>(
    //                       buildWhen: (pre, current) {
    //                         if (current is SignInLoadingState) {
    //                           return true;
    //                         } else if (current is SignInSuccessfulState) {
    //                           return true;
    //                         } else if (current is SignInErrorState) {
    //                           return true;
    //                         } else {
    //                           return false;
    //                         }
    //                       },
    //                       builder: (context, state) {
    //                         return (state is SignInLoadingState)
    //                             ? const Center(
    //                                 child: CircularProgressIndicator.adaptive())
    //                             : CustomButton(
    //                                 widget: const Text("Sign Up"),
    //                                 function: () {
    //                                   if (formKey.currentState!.validate()) {
    //                                     AuthCubit.get(context).signUp(
    //                                         password: passwordController.text,
    //                                         email: emailController.text,
    //                                         name: userNameController.text);
    //                                   }
    //                                 },
    //                                 color: ColorManage.primaryYellow,
    //                                 disable: true);
    //                       },
    //                     ),
    //                     SizedBox(height: 25.h),
    //                     //Register now
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 8.h,
    //           ),

    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: ColorManage.primaryYellow,
                          size: 36.sp,
                        )),
                    SizedBox(
                      width: 75.w,
                    ),
                    Center(
                        child: Text("Sign Up To Travel",
                            style: getSemiBoldStyle(
                                color: Colors.white, height: 1, fontSize: 28.h))),
                  ],
                ),
                Container(
                  height: 720.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.r),
                        topLeft: Radius.circular(40.r),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(24.sp),
                    child: SafeArea(
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              //email falid
                              CustomTextField(
                                  iconData: Icon(Icons.email),

                                  controller: emailController,
                                  hint: 'email',
                                  fieldValidator: emailValidator),
                              const SizedBox(height: 10),
                              //password's
                              BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  return CustomTextField(
                                    iconData: const Icon(FontAwesomeIcons.lock),
                                    fieldValidator: passwordValidator,
                                    controller: passwordController,
                                    hint: 'password',
                                    password: AuthCubit.get(context).visibility,
                                    passwordTwo: true,
                                    function: () {
                                      AuthCubit.get(context).changeState();
                                    },
                                  );
                                },
                              ),

                              SizedBox(height:10.h),

                              CustomTextField(
                                  iconData: Icon(FontAwesomeIcons.user),

                                  controller: nameController,
                                  hint: 'Name',
                                  fieldValidator: (value){
                                    if(value.isEmpty)
                                    {
                                      return "Please Enter name";
                                    }
                                  }),

                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  SizedBox(width: 12.w,),

                                  Icon(FontAwesomeIcons.venusMars ,
                                  color: ColorManage.gray,
                                  ),
                                  SizedBox(width: 20.w,),
                                  SizedBox(
                                    width: 300,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(

                                        hint: Text(
                                          'Gender',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme
                                                .of(context)
                                                .hintColor,
                                          ),
                                        ),
                                        items: items
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as String;
                                          });
                                        },
                                        buttonHeight: 40,
                                        buttonWidth: 140,
                                        itemHeight: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),


                              const Divider(
                                color: ColorManage.gray,
                                height: 3,
                                thickness: 1,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  SizedBox(width: 12.w,),

                                  const Icon(FontAwesomeIcons.ring ,
                                    color: ColorManage.gray,
                                  ),
                                  SizedBox(width: 20.w,),
                                  SizedBox(
                                    width: 300,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(

                                        hint: Text(
                                          'Status',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme
                                                .of(context)
                                                .hintColor,
                                          ),
                                        ),
                                        items: status
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        value: selectStatusValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectStatusValue = value as String;
                                          });
                                        },
                                        buttonHeight: 40,
                                        buttonWidth: 140,
                                        itemHeight: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10.h),
                              const Divider(
                                color: ColorManage.gray,
                                height: 3,
                                thickness: 1,
                              ),
                              CountryListPick(
                                  appBar: AppBar(
                                    backgroundColor: Colors.blue,
                                    title: const Text('Select Country'),
                                  ),

                                  // if you need custome picker use this
                                  // pickerBuilder: (context, CountryCode countryCode){

                                  // },
                                  pickerBuilder: (context, countryCode) {
                                    return Row(
                                      children: [
                                        Image.asset(
                                          countryCode!.flagUri!,
                                          package: 'country_list_pick',
                                          height: 20,
                                        ),
                                        SizedBox(width: 20,),
                                        Text(countryCode.name!,style: TextStyle(
                                          color: ColorManage.gray
                                        )),
                                        SizedBox(width: 215.w,),
                                        Icon(Icons.arrow_drop_down,
                                        color: ColorManage.gray,
                                        )
                                      ],
                                    );
                                  },
                                  // To disable option set to false
                                  theme: CountryTheme(
                                    isShowFlag: true,
                                    isShowTitle: true,
                                    isShowCode: false,
                                    isDownIcon: true,
                                    showEnglishName: true,
                                  ),
                                  // Set default value
                                  initialSelection: '+62',
                                  // or
                                  // initialSelection: 'US'
                                  onChanged: (CountryCode? code) {
                                    setState(() {
                                      nationality = code!.name;
                                    });
                                  },
                                  // Whether to allow the widget to set a custom UI overlay
                                  useUiOverlay: true,
                                  // Whether the country list should be wrapped in a SafeArea
                                  useSafeArea: false
                              ),
                              const SizedBox(height: 10),

                              //sign in button
                              BlocBuilder<AuthCubit, AuthState>(
                                buildWhen: (pre, current) {
                                  if (current is SignInLoadingState) {
                                    return true;
                                  } else if (current is SignInSuccessfulState) {
                                    return true;
                                  } else if (current is SignInErrorState) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                                builder: (context, state) {
                                  return (state is SignInLoadingState)
                                      ? const Center(
                                      child:
                                      CircularProgressIndicator.adaptive())
                                      : CustomButton(
                                      widget: const Text("Sign In"),
                                      function: () {
                                        if (formKey.currentState!.validate())
                                        {
                                          AuthCubit.get(context).signUp(
                                            nationality: nationality!,
                                               status: selectStatusValue!,
                                               name: nameController.text,
                                              password: passwordController.text,
                                              email: emailController.text);
                                        }
                                      },
                                      color: ColorManage.primaryYellow,
                                      disable: true);
                                },
                              ),
                              SizedBox(height: 25.h),
                              //Register now
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I already have account? ",
                        style: getBoldStyle(
                            color: Colors.white, height: 1, fontSize: 24.sp)),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.welcomePage);
                        },
                        child: Text("SIGN IN",
                            style: getBoldStyle(
                                color: ColorManage.primaryYellow,
                                height: 1,
                                fontSize: 24.sp))),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

