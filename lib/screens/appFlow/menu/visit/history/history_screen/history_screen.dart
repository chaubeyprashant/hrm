import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrm_app/screens/appFlow/menu/visit/history/history_screen/history_provider.dart';
import 'package:hrm_app/screens/appFlow/menu/visit/visit_details/visit_details.dart';
import 'package:hrm_app/utils/nav_utail.dart';
import 'package:hrm_app/utils/res.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryProvider(),
      child: Consumer<HistoryProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  provider.selectDate(context);
                },
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.selectDate(context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleLeft,
                          size: 30,
                          color: AppColors.colorPrimary,
                        )),
                    const Spacer(),
                    Center(
                        child: Text(
                      provider.monthYear ?? "",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          provider.selectDate(context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.angleRight,
                          size: 30,
                          color: AppColors.colorPrimary,
                        )),
                  ],
                ),
              ),
              provider.isLoading
                  ? provider.responseVisitHistory!.data!.history!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: provider.responseVisitHistory?.data
                                      ?.history?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        NavUtil.navigateScreen(
                                            context,
                                            VisitDetails(
                                              visitID: provider
                                                  .responseVisitHistory
                                                  ?.data
                                                  ?.history?[index]
                                                  .id,
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 8),
                                        child: Card(
                                          elevation: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Stack(
                                              children: [
                                                const Positioned.fill(
                                                  child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            Colors.blueAccent,
                                                        size: 20,
                                                      )),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          provider
                                                                  .responseVisitHistory
                                                                  ?.data
                                                                  ?.history?[
                                                                      index]
                                                                  .month ??
                                                              "",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .blue),
                                                        ),
                                                        Text(
                                                          provider
                                                                  .responseVisitHistory
                                                                  ?.data
                                                                  ?.history?[
                                                                      index]
                                                                  .day ??
                                                              "",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            provider
                                                                    .responseVisitHistory
                                                                    ?.data
                                                                    ?.history?[
                                                                        index]
                                                                    .title ??
                                                                "",
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${provider.responseVisitHistory?.data?.history?[index].started ?? ""} - ${provider.responseVisitHistory?.data?.history?[index].reached ?? ""}",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Color(int.parse(provider
                                                                        .responseVisitHistory
                                                                        ?.data
                                                                        ?.history?[
                                                                            index]
                                                                        .statusColor ??
                                                                    "")),
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                                width: 3.0,
                                                              ),
                                                              color: Color(int.parse(provider
                                                                      .responseVisitHistory
                                                                      ?.data
                                                                      ?.history?[
                                                                          index]
                                                                      .statusColor ??
                                                                  "")),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: DottedBorder(
                                                              color:
                                                                  Colors.white,
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              radius: const Radius
                                                                  .circular(5),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 3),
                                                              strokeWidth: 1,
                                                              child: Text(
                                                                provider
                                                                        .responseVisitHistory
                                                                        ?.data
                                                                        ?.history?[
                                                                            index]
                                                                        .status ??
                                                                    "",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      :  Expanded(
                          child: Center(
                              child: Text(
                            tr("no_visit_history_found"),
                            style: const TextStyle(
                                color: Color(0x65555555),
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          )),
                        )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
