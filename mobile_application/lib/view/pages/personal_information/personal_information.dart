import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
import 'package:graduation_project/view_model/bloc/profile_cubit/profile_cubit.dart';

import '../../components/phone_text/phote_text.dart';
import '../../components/text/text_custom.dart';

class PersonalInformationScreen extends StatefulWidget {
  PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController phoneNumberEdit = TextEditingController();

  String? countryISOCodePhone;
  String nationalController = 'Eg';
  String? email;
  String? name;
  String? phone;
  String? national;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    emailController.text = ProfileCubit.get(context).user!.email!;
    fullName.text = ProfileCubit.get(context).user!.name!;
    phoneNumber.text = ProfileCubit.get(context).user!.phone!;
    print(ProfileCubit.get(context).user!.phone!);
    nationalController = ProfileCubit.get(context).user!.nationality!;
    email = emailController.text;
    name = fullName.text;
    phone = phoneNumber.text;
    national = nationalController;
    super.initState();
  }

  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Personal Information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state)
        {
          if(state is ProfileSuccessfullyUpdateState)
          {
            ProfileCubit.get(context).getProfile();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Update Successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
          else if(state is ProfileErrorUpdateState)
          {
            ScaffoldMessenger.of(context).showSnackBar(
             const  SnackBar(
                content: Text('Update Error'),
                backgroundColor: Colors.red,
              ),
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 0.8.sh,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCustom(
                              text: 'Full Name',
                              textAlign: TextAlign.start,
                              color: ColorManage.textFormLabelColor,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextField(
                              hint: 'Full Name',
                              enable: false,
                              controller: fullName,
                              fieldValidator: (value) {
                                if (value!.trim().isEmpty || value == ' ') {
                                  return 'Full Name must be not Empty';
                                }
                                return null;
                              },
                              iconData: Icon(Icons.person),
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextCustom(
                              text: 'E-mail',
                              textAlign: TextAlign.start,
                              color: ColorManage.textFormLabelColor,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextField(
                              enable: false,
                              controller: emailController,
                              iconData: Icon(Icons.email),
                              fieldValidator: (value) {
                                if (value!.trim().isEmpty || value == ' ') {
                                  return 'Email must be not Empty';
                                }
                                if (!RegExp(
                                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              hint: 'E-mail',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextCustom(
                              text: 'Phone Number',
                              textAlign: TextAlign.start,
                              color: ColorManage.textFormLabelColor,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // TextFormFieldCustom(
                            //   controller: phoneNumber,
                            //   validate: (value) {
                            //     if (value!.trim().isEmpty || value == ' ') {
                            //       return 'phone must be not Empty';
                            //     }
                            //
                            //     return null;
                            //   },
                            //   keyboardType: TextInputType.phone,
                            // ),

                            InkWell(
                              onTap: () {
                                phoneNumberEdit.clear();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextCustom(
                                                  text: "Add New Number",
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManage.black,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: SvgPicture.asset(
                                                      "assets/icons/Subtract.svg"))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 37.h,
                                          ),
                                          phoneText(
                                              phoneNumber: phoneNumberEdit,
                                              initCountryCode: "Eg",
                                              function: (value) {
                                                print(value.countryCode);

                                                setState(() {
                                                  countryISOCodePhone =
                                                      value.countryCode;
                                                });
                                              }),
                                          CustomButton(
                                            color: ColorManage.primaryBlue,
                                            radius: 10,
                                            size: Size(0.8.sw, 0.06.sh),
                                            widget: TextCustom(
                                              text: "Save",
                                              color: ColorManage.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            function: () {
                                              print(phoneNumberEdit.text);
                                              if (phoneNumber.text !=
                                                  phoneNumberEdit.text) {
                                                setState(() {
                                                  print("Amr");
                                                });
                                              }
                                              phoneNumberEdit.text =
                                                  (countryISOCodePhone! +
                                                      phoneNumberEdit.text);
                                              setState(() {
                                                phoneNumber.text =
                                                    phoneNumberEdit.text;
                                              });

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CustomTextField(
                                enable: false,
                                controller: phoneNumber,
                                iconData: Icon(Icons.phone),
                                fieldValidator: (value) {},
                                keyboardType: TextInputType.number,
                                hint: 'Phone Number',
                              ),
                            ),

                            SizedBox(
                              height: 20.h,
                            ),

                            TextCustom(
                              text: 'Nationality',
                              textAlign: TextAlign.start,
                              color: ColorManage.textFormLabelColor,
                            ),
                            SizedBox(
                              height: 20.h,
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
                                return Container(
                                  height: 80.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorManage.white,
                                    border: Border.all(
                                      color: ColorManage.gray,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          countryCode!.flagUri!,
                                          package: 'country_list_pick',
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(countryCode.name!,
                                            style: const TextStyle(
                                                color: ColorManage.black)),
                                        Spacer(),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: ColorManage.gray,
                                        )
                                      ],
                                    ),
                                  ),
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
                              initialSelection: nationalController,

                              // or
                              // initialSelection: 'US'
                              onChanged: (CountryCode? code) {
                                setState(() {
                                  nationalController = code!.code!;
                                });
                              },
                              // Whether to allow the widget to set a custom UI overlay
                              // Whether the country list should be wrapped in a SafeArea
                            ),

                            Spacer(),
                            Center(
                              child: (state is ProfileLoadingUpdateState)
                                  ?const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                                  : CustomButton(
                                size: Size(0.8.sw, 0.06.sh),
                                radius: 10,
                                color: ColorManage.primaryBlue,
                                disable: true,
                                widget: TextCustom(
                                  text: 'Save',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManage.white,
                                ),
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.updateProfileInfo(
                                        phoneNumber.text, nationalController);
                                  } else {
                                    // showToast(message: "Please Complete  Form");
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
