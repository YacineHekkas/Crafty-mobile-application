
import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class ReportProblem extends StatelessWidget {
  final String email;
  final _key = GlobalKey<FormState>();
  final String pageName;
  TextEditingController body = TextEditingController();

  ReportProblem({Key? key, required this.email,required this.pageName}) : super(key: key);

  sendemail(String subject, String bodytext, String recipientemail) async {
    final Email email1 = Email(
      body: bodytext,
      subject: subject,
      recipients: [recipientemail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConst.bgColor,
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xfff5f3f3),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  pageName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: AppConst.font,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1d354d),
                  ),
                ),
              ),
              const Text(
                'Tell us what\'s in your mind ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _key,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffffffff),
                        ),
                        child: TextFormField(
                          controller: body,
                          minLines: 3,
                          maxLines: 14,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type your $pageName',
                            contentPadding: const EdgeInsets.all(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _key.currentState!.save();
                            sendemail("Report a problem", body.text,
                                email);
                          },

                          child: Container(

                            width: MediaQuery.of(context).size.width /4,
                            height: MediaQuery.of(context).size.height /20,
                            decoration: BoxDecoration(
                              color:AppConst.darkBlue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Align(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Send",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.send_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),

                        ),
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}
