// ignore_for_file: unused_import, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/services/functions.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/image/image.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final _dobController = TextEditingController();

@RoutePage()
class EditListingPage extends ConsumerStatefulWidget {
  const EditListingPage(this.item, {super.key});
  final SearchResultItem? item;
  @override
  _EditListingPageState createState() => _EditListingPageState();
}

class _EditListingPageState extends ConsumerState<EditListingPage> {
  final picker = ImagePicker();

  bool am1 = false;
  bool am2 = false;
  bool am3 = false;
  bool am4 = false;
  bool am5 = false;
  bool am6 = false;
  bool am7 = false;
  bool am8 = false;
  bool am9 = false;
  bool am10 = false;
  bool am11 = false;
  bool am12 = false;

  List<String> amenities = [];

  bool askPrice = false;
  bool negotiable = false;

  List<S2Choice<String>>? subCategoryData = [];
  List<S2Choice<String>>? subLocationData = [];
  List<S2Choice<String>>? genderData = [
    S2Choice<String>(title: 'Male', value: 'Male'),
    S2Choice<String>(title: 'Female', value: 'Female'),
  ];
  List<S2Choice<String>>? heightData = [
    S2Choice<String>(title: "less than 4'9", value: "less than 4'9"),
    S2Choice<String>(title: "4'10 - 147 cm", value: "4'10 - 147 cm"),
    S2Choice<String>(title: "4'11 - 150 cm", value: "4'11 - 150 cm"),
    S2Choice<String>(title: "5'0 - 152 cm", value: "5'0 - 152 cm"),
    S2Choice<String>(title: "5'1 - 155 cm", value: "5'1 - 155 cm"),
    S2Choice<String>(title: "5'2 - 157 cm", value: "5'2 - 157 cm"),
    S2Choice<String>(title: "5'3 - 160 cm", value: "5'3 - 160 cm"),
    S2Choice<String>(title: "5'4 - 163 cm", value: "5'4 - 163 cm"),
    S2Choice<String>(title: "5'5 - 165 cm", value: "5'5 - 165 cm"),
    S2Choice<String>(title: "5'6 - 168 cm", value: "5'6 - 168 cm"),
    S2Choice<String>(title: "5'7 - 170 cm", value: "5'7 - 170 cm"),
    S2Choice<String>(title: "5'8 - 173 cm", value: "5'8 - 173 cm"),
    S2Choice<String>(title: "5'9 - 175 cm", value: "5'9 - 175 cm"),
    S2Choice<String>(title: "5'10 - 178 cm", value: "5'10 - 178 cm"),
    S2Choice<String>(title: "5'11 - 180 cm", value: "5'11 - 180 cm"),
    S2Choice<String>(title: "6'0 - 183 cm", value: "6'0 - 183 cm"),
    S2Choice<String>(title: "6'1 - 185 cm", value: "6'1 - 185 cm"),
    S2Choice<String>(title: "6'2 - 188 cm", value: "6'2 - 188 cm"),
    S2Choice<String>(title: "6'3 - 190 cm", value: "6'3 - 190 cm"),
    S2Choice<String>(title: "6'4 - 193 cm", value: "6'4 - 193 cm"),
    S2Choice<String>(title: "6'5 - 196 cm", value: "6'5 - 196 cm"),
    S2Choice<String>(title: "6'6 - 198 cm", value: "6'6 - 198 cm"),
    S2Choice<String>(title: "6'7 - 201 cm", value: "6'7 - 201 cm"),
    S2Choice<String>(title: "6'8 - 203 cm", value: "6'8 - 203 cm"),
    S2Choice<String>(title: "6'9 - 206 cm", value: "6'9 - 206 cm"),
    S2Choice<String>(title: "6'10 - 208 cm", value: "6'10 - 208 cm"),
    S2Choice<String>(title: "6'11 - 211 cm", value: "6'11 - 211 cm"),
    S2Choice<String>(title: "more than 7'0", value: "more than 7'0"),
  ];
  List<S2Choice<String>>? weightData = [
    S2Choice<String>(title: 'more than 40 kg', value: 'more than 40kg'),
    S2Choice<String>(title: '88 lbs - 40 kg', value: '88 lbs - 40 kg'),
    S2Choice<String>(title: '90 lbs - 41 kg', value: '90 lbs - 41 kg'),
    S2Choice<String>(title: '93 lbs - 42 kg', value: '93 lbs - 42 kg'),
    S2Choice<String>(title: '95 lbs - 43 kg', value: '95 lbs - 43 kg'),
    S2Choice<String>(title: '97 lbs - 44 kg', value: '97 lbs - 44 kg'),
    S2Choice<String>(title: '99 lbs - 45 kg', value: '99 lbs - 45 kg'),
    S2Choice<String>(title: '101 lbs - 46 kg', value: '101 lbs - 46 kg'),
    S2Choice<String>(title: '103 lbs - 47 kg', value: '103 lbs - 47 kg'),
    S2Choice<String>(title: '105 lbs - 48 kg', value: '105 lbs - 48 kg'),
    S2Choice<String>(title: '108 lbs - 49 kg', value: '108 lbs - 49 kg'),
    S2Choice<String>(title: '110 lbs - 50 kg', value: '110 lbs - 50 kg'),
    S2Choice<String>(title: '112 lbs - 51 kg', value: '112 lbs - 51 kg'),
    S2Choice<String>(title: '115 lbs - 52 kg', value: '115 lbs - 52 kg'),
    S2Choice<String>(title: '117 lbs - 53 kg', value: '117 lbs - 53 kg'),
    S2Choice<String>(title: '119 lbs - 54 kg', value: '119 lbs - 54 kg'),
    S2Choice<String>(title: '121 lbs - 55 kg', value: '121 lbs - 55 kg'),
    S2Choice<String>(title: '123 lbs - 56 kg', value: '123 lbs - 56 kg'),
    S2Choice<String>(title: '125 lbs - 57 kg', value: '125 lbs - 57 kg'),
    S2Choice<String>(title: '128 lbs - 58 kg', value: '128 lbs - 58 kg'),
    S2Choice<String>(title: '130 lbs - 59 kg', value: '130 lbs - 59 kg'),
    S2Choice<String>(title: '132 lbs - 60 kg', value: '132 lbs - 60 kg'),
    S2Choice<String>(title: '134 lbs - 61 kg', value: '134 lbs - 61 kg'),
    S2Choice<String>(title: '137 lbs - 62 kg', value: '137 lbs - 62 kg'),
    S2Choice<String>(title: '139 lbs - 63 kg', value: '139 lbs - 63 kg'),
    S2Choice<String>(title: '141 lbs - 64 kg', value: '141 lbs - 64 kg'),
    S2Choice<String>(title: '143 lbs - 65 kg', value: '143 lbs - 65 kg'),
    S2Choice<String>(title: '146 lbs - 66 kg', value: '146 lbs - 66 kg'),
    S2Choice<String>(title: '148 lbs - 67 kg', value: '148 lbs - 67 kg'),
    S2Choice<String>(title: '150 lbs - 68 kg', value: '150 lbs - 68 kg'),
    S2Choice<String>(title: '152 lbs - 69 kg', value: '152 lbs - 69 kg'),
    S2Choice<String>(title: '154 lbs - 70 kg', value: '154 lbs - 70 kg'),
    S2Choice<String>(title: '156 lbs - 71 kg', value: '156 lbs - 71 kg'),
    S2Choice<String>(title: '158 lbs - 72 kg', value: '158 lbs - 72 kg'),
    S2Choice<String>(title: '161 lbs - 73 kg', value: '161 lbs - 73 kg'),
    S2Choice<String>(title: '163 lbs - 74 kg', value: '163 lbs - 74 kg'),
    S2Choice<String>(title: '165 lbs - 75 kg', value: '165 lbs - 75 kg'),
    S2Choice<String>(title: '167 lbs - 76 kg', value: '167 lbs - 76 kg'),
    S2Choice<String>(title: '169 lbs - 77 kg', value: '169 lbs - 77 kg'),
    S2Choice<String>(title: '171 lbs - 78 kg', value: '171 lbs - 78 kg'),
    S2Choice<String>(title: '174 lbs - 79 kg', value: '174 lbs - 79 kg'),
    S2Choice<String>(title: '176 lbs - 80 kg', value: '176 lbs - 80 kg'),
    S2Choice<String>(title: '178 lbs - 81 kg', value: '178 lbs - 81 kg'),
    S2Choice<String>(title: '180 lbs - 82 kg', value: '180 lbs - 82 kg'),
    S2Choice<String>(title: '183 lbs - 83 kg', value: '183 lbs - 83 kg'),
    S2Choice<String>(title: '185 lbs - 84 kg', value: '185 lbs - 84 kg'),
    S2Choice<String>(title: '187 lbs - 85 kg', value: '187 lbs - 85 kg'),
    S2Choice<String>(title: '189 lbs - 86 kg', value: '189 lbs - 86 kg'),
    S2Choice<String>(title: '191 lbs - 87 kg', value: '191 lbs - 87 kg'),
    S2Choice<String>(title: '194 lbs - 88 kg', value: '194 lbs - 88 kg'),
    S2Choice<String>(title: '196 lbs - 89 kg', value: '196 lbs - 89 kg'),
    S2Choice<String>(title: '198 lbs - 90 kg', value: '198 lbs - 90 kg'),
    S2Choice<String>(title: '200 lbs - 91 kg', value: '200 lbs - 91 kg'),
    S2Choice<String>(title: '202 lbs - 92 kg', value: '202 lbs - 92 kg'),
    S2Choice<String>(title: '205 lbs - 93 kg', value: '205 lbs - 93 kg'),
    S2Choice<String>(title: '207 lbs - 94 kg', value: '207 lbs - 94 kg'),
    S2Choice<String>(title: '209 lbs - 95 kg', value: '209 lbs - 95 kg'),
    S2Choice<String>(title: '211 lbs - 96 kg', value: '211 lbs - 96 kg'),
    S2Choice<String>(title: '213 lbs - 97 kg', value: '213 lbs - 97 kg'),
    S2Choice<String>(title: '216 lbs - 98 kg', value: '216 lbs - 98 kg'),
    S2Choice<String>(title: '218 lbs - 99 kg', value: '218 lbs - 99 kg'),
    S2Choice<String>(title: '220 lbs - 100 kg', value: '220 lbs - 100 kg'),
    S2Choice<String>(title: '222 lbs - 101 kg', value: '222 lbs - 101 kg'),
    S2Choice<String>(title: '224 lbs - 102 kg', value: '224 lbs - 102 kg'),
    S2Choice<String>(title: '227 lbs - 103 kg', value: '227 lbs - 103 kg'),
    S2Choice<String>(title: '229 lbs - 104 kg', value: '229 lbs - 104 kg'),
    S2Choice<String>(title: '231 lbs - 105 kg', value: '231 lbs - 105 kg'),
    S2Choice<String>(title: '233 lbs - 106 kg', value: '233 lbs - 106 kg'),
    S2Choice<String>(title: '235 lbs - 107 kg', value: '235 lbs - 107 kg'),
    S2Choice<String>(title: '238 lbs - 108 kg', value: '238 lbs - 108 kg'),
    S2Choice<String>(title: '240 lbs - 109 kg', value: '240 lbs - 109 kg'),
    S2Choice<String>(title: '242 lbs - 110 kg', value: '242 lbs - 110 kg'),
    S2Choice<String>(title: '244 lbs - 111 kg', value: '244 lbs - 111 kg'),
    S2Choice<String>(title: '246 lbs - 112 kg', value: '246 lbs - 112 kg'),
    S2Choice<String>(title: '249 lbs - 113 kg', value: '249 lbs - 113 kg'),
    S2Choice<String>(title: '251 lbs - 114 kg', value: '251 lbs - 114 kg'),
    S2Choice<String>(title: '253 lbs - 115 kg', value: '253 lbs - 115 kg'),
    S2Choice<String>(title: '255 lbs - 116 kg', value: '255 lbs - 116 kg'),
    S2Choice<String>(title: '258 lbs - 117 kg', value: '258 lbs - 117 kg'),
    S2Choice<String>(title: '260 lbs - 118 kg', value: '260 lbs - 118 kg'),
    S2Choice<String>(title: '262 lbs - 119 kg', value: '262 lbs - 119 kg'),
    S2Choice<String>(title: '265 lbs - 120 kg', value: '265 lbs - 120 kg'),
    S2Choice<String>(title: '267 lbs - 121 kg', value: '267 lbs - 121 kg'),
    S2Choice<String>(title: '269 lbs - 122 kg', value: '269 lbs - 122 kg'),
    S2Choice<String>(title: '271 lbs - 123 kg', value: '271 lbs - 123 kg'),
    S2Choice<String>(title: '273 lbs - 124 kg', value: '273 lbs - 124 kg'),
    S2Choice<String>(title: '275 lbs - 125 kg', value: '275 lbs - 125 kg'),
    S2Choice<String>(title: '277 lbs - 126 kg', value: '277 lbs - 126 kg'),
    S2Choice<String>(title: '279 lbs - 127 kg', value: '279 lbs - 127 kg'),
    S2Choice<String>(title: '282 lbs - 128 kg', value: '282 lbs - 128 kg'),
    S2Choice<String>(title: '284 lbs - 129 kg', value: '284 lbs - 129 kg'),
    S2Choice<String>(title: '286 lbs - 130 kg', value: '286 lbs - 130 kg'),
    S2Choice<String>(title: '288 lbs - 131 kg', value: '288 lbs - 131 kg'),
    S2Choice<String>(title: '291 lbs - 132 kg', value: '291 lbs - 132 kg'),
    S2Choice<String>(title: '293 lbs - 133 kg', value: '293 lbs - 133 kg'),
    S2Choice<String>(title: '295 lbs - 134 kg', value: '295 lbs - 134 kg'),
    S2Choice<String>(title: '297 lbs - 135 kg', value: '297 lbs - 135 kg'),
    S2Choice<String>(title: '300 lbs - 136 kg', value: '300 lbs - 136 kg'),
    S2Choice<String>(title: '302 lbs - 137 kg', value: '302 lbs - 137 kg'),
    S2Choice<String>(title: '304 lbs - 138 kg', value: '304 lbs - 138 kg'),
    S2Choice<String>(title: '306 lbs - 139 kg', value: '306 lbs - 139 kg'),
    S2Choice<String>(title: '308 lbs - 140 kg', value: '308 lbs - 140 kg'),
    S2Choice<String>(title: 'less than 140', value: 'less than 140'),
  ];
  List<S2Choice<String>>? bodyData = [
    S2Choice<String>(title: 'Slender', value: 'Slender'),
    S2Choice<String>(title: 'Average', value: 'Average'),
    S2Choice<String>(title: 'Athletic', value: 'Athletic'),
    S2Choice<String>(title: 'Chubby', value: 'Chubby'),
    S2Choice<String>(title: 'Heavyset', value: 'Heavyset'),
    S2Choice<String>(title: 'Petite', value: 'Petite'),
    S2Choice<String>(title: 'Curvy', value: 'Curvy'),
    S2Choice<String>(title: 'Disabled', value: 'Disabled'),
    S2Choice<String>(title: 'Ask Me Later', value: 'Ask Me Later'),
  ];
  List<S2Choice<String>>? timeData = [
    S2Choice<String>(title: '1:00 AM', value: '1:00 AM'),
    S2Choice<String>(title: '2:00 AM', value: '2:00 AM'),
    S2Choice<String>(title: '3:00 AM', value: '3:00 AM'),
    S2Choice<String>(title: '4:00 AM', value: '4:00 AM'),
    S2Choice<String>(title: '5:00 AM', value: '5:00 AM'),
    S2Choice<String>(title: '6:00 AM', value: '6:00 AM'),
    S2Choice<String>(title: '7:00 AM', value: '7:00 AM'),
    S2Choice<String>(title: '8:00 AM', value: '8:00 AM'),
    S2Choice<String>(title: '9:00 AM', value: '9:00 AM'),
    S2Choice<String>(title: '10:00 AM', value: '10:00 AM'),
    S2Choice<String>(title: '11:00 AM', value: '11:00 AM'),
    S2Choice<String>(title: '12:00 AM', value: '12:00 AM'),
    S2Choice<String>(title: '1:00 PM', value: '1:00 PM'),
    S2Choice<String>(title: '2:00 PM', value: '2:00 PM'),
    S2Choice<String>(title: '3:00 PM', value: '3:00 PM'),
    S2Choice<String>(title: '4:00 PM', value: '4:00 PM'),
    S2Choice<String>(title: '5:00 PM', value: '5:00 PM'),
    S2Choice<String>(title: '6:00 PM', value: '6:00 PM'),
    S2Choice<String>(title: '7:00 PM', value: '7:00 PM'),
    S2Choice<String>(title: '8:00 PM', value: '8:00 PM'),
    S2Choice<String>(title: '9:00 PM', value: '9:00 PM'),
    S2Choice<String>(title: '10:00 PM', value: '10:00 PM'),
    S2Choice<String>(title: '11:00 PM', value: '11:00 PM'),
    S2Choice<String>(title: '12:00 PM', value: '12:00 PM'),
    S2Choice<String>(title: 'Closed', value: 'Closed'),
  ];
  List<S2Choice<String>>? appearanceData = [
    S2Choice<String>(title: 'Charming', value: 'Charming'),
    S2Choice<String>(title: 'Average', value: 'Average'),
    S2Choice<String>(title: 'Good Looking', value: 'Good Looking'),
    S2Choice<String>(title: 'Pretty', value: 'Pretty'),
    S2Choice<String>(title: 'Attractive', value: 'Attractive'),
    S2Choice<String>(title: 'Very Beautiful', value: 'Very Beautiful'),
  ];
  List<S2Choice<String>>? complexionData = [
    S2Choice<String>(title: 'Very fair', value: 'Very fair'),
    S2Choice<String>(title: 'Gold fair', value: 'Gold fair'),
    S2Choice<String>(title: 'Tanned', value: 'Tanned'),
    S2Choice<String>(title: 'Darker', value: 'Darker'),
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
  ];
  List<S2Choice<String>>? maritalStatusData = [
    S2Choice<String>(title: 'Never Married', value: 'Never Married'),
    S2Choice<String>(title: 'Lived Together', value: 'Lived Together'),
    S2Choice<String>(title: 'Separated/Divorced', value: 'Separated/Divorced'),
    S2Choice<String>(title: 'Widowed/Annulled', value: 'Widowed/Annulled'),
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
  ];
  List<S2Choice<String>>? eduData = [
    S2Choice<String>(title: 'High school', value: 'High school'),
    S2Choice<String>(
        title: 'Professional qualification',
        value: 'Professional qualification'),
    S2Choice<String>(title: 'Associates degree', value: 'Associates degree'),
    S2Choice<String>(title: 'Bachelors degree', value: 'Bachelors degree'),
    S2Choice<String>(title: 'Masters degree', value: 'Masters degree'),
    S2Choice<String>(title: 'Ph.D/Post doctoral', value: 'Ph.D/Post doctoral'),
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
  ];
  List<S2Choice<String>>? carrerData = [
    S2Choice<String>(title: 'Accounting/Finance', value: 'Accounting/Finance'),
    S2Choice<String>(title: 'Advertising/Media', value: 'Advertising/Media'),
    S2Choice<String>(title: 'Arts/Culture/Music', value: 'Arts/Culture/Music'),
    S2Choice<String>(title: 'Builder/Farmer', value: 'Builder/Farmer'),
    S2Choice<String>(
        title: 'Software Software Eng/Computer',
        value: 'Software Software Eng/Computer'),
    S2Choice<String>(
        title: 'Beauty/Cosmetics/Fashion', value: 'Beauty/Cosmetics/Fashion'),
    S2Choice<String>(
        title: 'Logistics/Warehouse', value: 'Logistics/Warehouse'),
    S2Choice<String>(
        title: 'Defense/Forces/Security', value: 'Defense/Forces/Security'),
    S2Choice<String>(
        title: 'Doctor Medical Doctor/Medical Officer',
        value: 'Doctor Medical Doctor/Medical Officer'),
    S2Choice<String>(title: 'Education/Academic', value: 'Education/Academic'),
    S2Choice<String>(
        title: 'Engineering/Architecture', value: 'Engineering/Architecture'),
    S2Choice<String>(
        title: 'Health Health Care/Nurse', value: 'Health Health Care/Nurse'),
    S2Choice<String>(
        title: 'Hospitality/Tourism/Chef', value: 'Hospitality/Tourism/Chef'),
    S2Choice<String>(
        title: 'Manager Human Manager/Human Resources',
        value: 'Manager Human Manager/Human Resources'),
    S2Choice<String>(title: 'Banking/Insurance ', value: 'Banking/Insurance '),
    S2Choice<String>(
        title: 'Internet New Internet/New Media',
        value: 'Internet New Internet/New Media'),
    S2Choice<String>(title: 'Lawyer/Legal', value: 'Lawyer/Legal'),
    S2Choice<String>(title: 'Marketing/Sales', value: 'Marketing/Sales'),
    S2Choice<String>(
        title: 'Political/Professor', value: 'Political/Professor'),
    S2Choice<String>(
        title: 'Business/Entrepreneur', value: 'Business/Entrepreneur'),
    S2Choice<String>(
        title: 'Public Customer Public/Customer Relations',
        value: 'Public Customer Public/Customer Relations'),
    S2Choice<String>(
        title: 'Publishing/Print/Graphics', value: 'Publishing/Print/Graphics'),
    S2Choice<String>(title: 'Research/Scientist', value: 'Research/Scientist'),
    S2Choice<String>(title: 'Retired/Charity', value: 'Retired/Charity'),
    S2Choice<String>(title: 'Secretary/Office', value: 'Secretary/Office'),
    S2Choice<String>(title: 'Student', value: 'Student'),
    S2Choice<String>(title: 'Teacher/Lecturer', value: 'Teacher/Lecturer'),
    S2Choice<String>(
        title: 'IT/Telecommunications', value: 'IT/Telecommunications'),
    S2Choice<String>(
        title: 'Transport/Manufacturing', value: 'Transport/Manufacturing'),
    S2Choice<String>(
        title: 'Government/Department', value: 'Government/Department'),
    S2Choice<String>(title: 'Writer/Journalist', value: 'Writer/Journalist'),
    S2Choice<String>(
        title: 'Other Self Other/Self Employed',
        value: 'Other Self Other/Self Employed'),
    S2Choice<String>(
        title: 'Unemployed/Unemployed/Housewife',
        value: 'Unemployed/Unemployed/Housewife')
  ];
  List<S2Choice<String>>? religionData = [
    S2Choice<String>(title: 'Buddhist', value: 'Buddhist'),
    S2Choice<String>(title: 'Atheist', value: 'Atheist'),
    S2Choice<String>(title: 'Catholic', value: 'Catholic'),
    S2Choice<String>(title: 'Christian', value: 'Christian'),
    S2Choice<String>(title: 'Islam', value: 'Islam'),
    S2Choice<String>(title: 'Hindu', value: 'Hindu'),
    S2Choice<String>(
        title: 'Spiritual but not religious',
        value: 'Spiritual but not religious'),
    S2Choice<String>(
        title: 'Dont believe in religion', value: 'Dont believe in religion'),
    S2Choice<String>(title: 'Other', value: 'Other'),
  ];
  List<S2Choice<String>>? ethnicityData = [
    S2Choice<String>(
        title: 'Sinhalese (Western)', value: 'Sinhalese (Western)'),
    S2Choice<String>(
        title: 'Sinhalese (Southern)', value: 'Sinhalese (Southern)'),
    S2Choice<String>(
        title: 'Sinhalese (Kandiyan)', value: 'Sinhalese (Kandiyan)'),
    S2Choice<String>(
        title: 'Sinhalese (North Western)', value: 'Sinhalese (North Western)'),
    S2Choice<String>(title: 'Sinhalese', value: 'Sinhalese'),
    S2Choice<String>(title: 'Tamil (North)', value: 'Tamil (North)'),
    S2Choice<String>(title: 'Tamil (Western)', value: 'Tamil (Western)'),
    S2Choice<String>(title: 'Tamil (Eastern)', value: 'Tamil (Eastern)'),
    S2Choice<String>(title: 'Muslim (Western)', value: 'Muslim (Western)'),
    S2Choice<String>(title: 'Muslim (South)', value: 'Muslim (South)'),
    S2Choice<String>(title: 'Mixed Race', value: 'Mixed Race'),
    S2Choice<String>(title: 'Other', value: 'Other'),
    S2Choice<String>(title: 'Malay', value: 'Malay'),
    S2Choice<String>(title: 'Muslim (Moor)', value: 'Muslim (Moor)'),
    S2Choice<String>(title: 'Tamil (Ceylon)', value: 'Tamil (Ceylon)'),
    S2Choice<String>(title: 'Burgher', value: 'Burgher'),
    S2Choice<String>(
        title: 'Muslim (Indian Moor)', value: 'Muslim (Indian Moor)'),
    S2Choice<String>(
        title: 'Muslim (Sri Lankan Moor)', value: 'Muslim (Sri Lankan Moor)'),
    S2Choice<String>(title: 'Tamil (Indian)', value: 'Tamil (Indian)'),
  ];
  List<S2Choice<String>>? socialClassData = [
    S2Choice<String>(title: "I don't care", value: "I don't care"),
    S2Choice<String>(title: "Upper/Rich class", value: "Upper/Rich class"),
    S2Choice<String>(title: "Upper/Middle class", value: "Upper/Middle class"),
    S2Choice<String>(title: "Middle class", value: "Middle class"),
    S2Choice<String>(title: "Working class", value: "Working class"),
    S2Choice<String>(title: "Lower/Middle class", value: "Lower/Middle class"),
    S2Choice<String>(title: "Ask me later", value: "Ask me later")
  ];
  List<S2Choice<String>>? residencyData = [
    S2Choice<String>(title: 'Citizen', value: 'Citizen'),
    S2Choice<String>(title: 'Permanent Resident', value: 'Permanent Resident'),
    S2Choice<String>(title: 'Work Permit', value: 'Work Permit'),
    S2Choice<String>(title: 'Student Visa', value: 'Student Visa'),
    S2Choice<String>(title: 'Temporary', value: 'Temporary'),
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
  ];
  List<S2Choice<String>>? familyValuesData = [
    S2Choice<String>(
        title: 'Very religious and traditional culture',
        value: 'Very religious and traditional culture'),
    S2Choice<String>(
        title: 'Traditional but open to modern culture',
        value: 'Traditional but open to modern culture'),
    S2Choice<String>(
        title: 'Mix of modern and traditional cultures',
        value: 'Mix of modern and traditional cultures'),
    S2Choice<String>(
        title: 'Open to the idea but unsure',
        value: 'Open to the idea but unsure'),
    S2Choice<String>(
        title: 'Open to western culture and any religion',
        value: 'Open to western culture and any religion'),
  ];
  List<S2Choice<String>>? smokingData = [
    S2Choice<String>(title: 'Always', value: 'Always'),
    S2Choice<String>(title: 'Sometimes', value: 'Sometimes'),
    S2Choice<String>(title: 'Never', value: 'Never'),
    S2Choice<String>(title: 'Trying to quit', value: 'Trying to quit'),
  ];
  List<S2Choice<String>>? drinkingData = [
    S2Choice<String>(title: 'Never drinks', value: 'Never drinks'),
    S2Choice<String>(title: 'Social drinker', value: 'Social drinker'),
    S2Choice<String>(title: 'Frequent drinker', value: 'Frequent drinker'),
    S2Choice<String>(title: 'Sober', value: 'Sober'),
  ];
  List<S2Choice<String>>? dietData = [
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
    S2Choice<String>(
        title: 'Strictly Vegetarian ', value: 'Strictly Vegetarian '),
    S2Choice<String>(
        title: 'Vegetarian/Eggetarian', value: 'Vegetarian/Eggetarian'),
    S2Choice<String>(
        title: 'Vegetarian/Fishtarian', value: 'Vegetarian/Fishtarian'),
    S2Choice<String>(
        title: 'Occasional Non-Vegetarian', value: 'Occasional Non-Vegetarian'),
    S2Choice<String>(title: 'Non-Vegetarian', value: 'Non-Vegetarian'),
  ];
  List<S2Choice<String>>? personalityData = [
    S2Choice<String>(title: 'Quiet and serious', value: 'Quiet and serious'),
    S2Choice<String>(title: 'Quiet and reserved', value: 'Quiet and reserved'),
    S2Choice<String>(
        title: 'Quiet, kind, and conscientious',
        value: 'Quiet, kind, and conscientious'),
    S2Choice<String>(
        title: 'Quiet serious sensitive and kind',
        value: 'Quiet serious sensitive and kind'),
    S2Choice<String>(
        title: 'Quietly forceful, original, and sensitive',
        value: 'Quietly forceful, original, and sensitive'),
    S2Choice<String>(
        title: 'Quiet, reflective, and idealistic',
        value: 'Quiet, reflective, and idealistic'),
    S2Choice<String>(
        title: 'Independent, original, analytical, and determined',
        value: 'Independent, original, analytical, and determined'),
    S2Choice<String>(
        title: 'Logical, original, creative thinkers.',
        value: 'Logical, original, creative thinkers.'),
    S2Choice<String>(
        title: 'Friendly, adaptable, action-oriented',
        value: 'Friendly, adaptable, action-oriented'),
    S2Choice<String>(
        title: 'Practical, traditional, and organized.',
        value: 'Practical, traditional, and organized.'),
    S2Choice<String>(
        title: 'People-oriented and fun-loving',
        value: 'People-oriented and fun-loving'),
    S2Choice<String>(
        title: 'Warm-hearted, popular, and conscientious',
        value: 'Warm-hearted, popular, and conscientious'),
    S2Choice<String>(
        title: 'Enthusiastic, idealistic, and creative',
        value: 'Enthusiastic, idealistic, and creative'),
    S2Choice<String>(
        title: 'Popular and sensitive, with outstanding people skills',
        value: 'Popular and sensitive, with outstanding people skills'),
    S2Choice<String>(
        title: 'Creative, resourceful, and intellectually quick',
        value: 'Creative, resourceful, and intellectually quick'),
    S2Choice<String>(
        title: 'Assertive and outspoken', value: 'Assertive and outspoken'),
    S2Choice<String>(title: 'Ask me later', value: 'Ask me later'),
  ];
  List<S2Choice<String>>? nextStepData = [
    S2Choice<String>(title: 'Meet the parents', value: 'Meet the parents'),
    S2Choice<String>(title: 'Horoscope Match', value: 'Horoscope Match'),
    S2Choice<String>(title: 'Have Online Chat', value: 'Have Online Chat'),
    S2Choice<String>(title: 'Real Meeting', value: 'Real Meeting'),
    S2Choice<String>(
        title: 'Coffee/Movies/Dinner in City',
        value: 'Coffee/Movies/Dinner in City'),
    S2Choice<String>(title: 'Phone Call / SMS', value: 'Phone Call / SMS'),
    S2Choice<String>(
        title: 'Short Relationship as friends',
        value: 'Short Relationship as friends')
  ];
  Color _catColor = Colors.grey;
  Color _subCatColor = Colors.grey;
  Color _locationColor = Colors.grey;
  Color _subLocationColor = Colors.grey;
  Color _mondayOpenColor = Colors.grey;
  Color _tuesdayOpenColor = Colors.grey;
  Color _wednesdayOpenColor = Colors.grey;
  Color _thursdayOpenColor = Colors.grey;
  Color _fridayOpenColor = Colors.grey;
  Color _saturedayOpenColor = Colors.grey;
  Color _sundayOpenColor = Colors.grey;
  Color _genderColor = Colors.grey;
  Color _bornDateColor = Colors.grey;
  Color _askPriceColor = Colors.grey;
  Color _thumbImgColor = ViwahaColor.primary;
  Color _galleryImgColor = ViwahaColor.primary;

  String _cat = 'Select One';
  String _gender = 'Select one';
  String _subCat = 'Select One';
  String _location = 'Select One';
  String _subLocation = 'Select One';
  String _alwaysOpen = 'Select One';
  String _openInHollyday = 'Select One';
  String _mondayOpen = 'Select One';
  String _mondayClose = 'Select One';
  String _tuesdayOpen = 'Select One';
  String _tuesdayClose = 'Select One';
  String _wednesdayOpen = 'Select One';
  String _wednesdayClose = 'Select One';
  String _thursdayOpen = 'Select One';
  String _thursdayClose = 'Select One';
  String _fridayOpen = 'Select One';
  String _fridayClose = 'Select One';
  String _saturedayOpen = 'Select One';
  String _saturedayClose = 'Select One';
  String _sundayOpen = 'Select One';
  String _sundayClose = 'Select One';

  String _genderData = 'Select one';
  String _heightData = 'Select one';
  String _weightData = 'Select one';
  String _bodyData = 'Select one';
  String _appearanceData = 'Select one';
  String _complexionData = 'Select one';
  String _maritalStatusData = 'Select one';
  String _eduData = 'Select one';
  String _carrerData = 'Select one';
  String _religionData = 'Select one';
  String _ethnicityData = 'Select one';
  String _socialClassData = 'Select one';
  String _residencyData = 'Select one';
  String _familyValuesData = 'Select one';
  String _smokingData = 'Select one';
  String _drinkingData = 'Select one';
  String _dietData = 'Select one';
  String _personalityData = 'Select one';
  String _nextStepData = 'Select one';

  List<String> extractStringList(String input) {
    // Remove the square brackets and split the string by commas
    String content = input.substring(1, input.length - 1);
    List<String> items = content.split(', ');
    return items;
  }

  Future<File> _fileFromImageUrl(String imgSrc) async {
    final response = await http.get(Uri.parse(imgSrc));
    final documentDirectory = await getApplicationDocumentsDirectory();
    List<String> parts = imgSrc.split('/');
    String filename = parts.last;
    final file = File(join(documentDirectory.path, filename));
    file.writeAsBytesSync(response.bodyBytes);

    return file;
  }

  @override
  void initState() {
    // TODO: implement initState
    final SearchResultItem? item = widget.item;
    List<String> stringAmenities =
        extractStringList(widget.item!.amenities.toString());
    if (widget.item!.image != null) {
      _fileFromImageUrl(widget.item!.image != null
              ? "https://viwaha.lk/${widget.item!.image.toString()}"
              : ref
                  .read(homeControllerProvider)
                  .getTumbImage(widget.item!.thumb_images)
                  .first
                  .toString())
          .then((value) => {
                ref.read(mainImageProvider.notifier).state = value.path,
                ref.read(mainImageNameProvider.notifier).state =
                    widget.item!.image != null
                        ? widget.item!.image.toString()
                        : ref
                            .read(homeControllerProvider)
                            .getTumbImage(widget.item!.thumb_images)
                            .first
                            .toString()
                            .substring(18)
              });
    }

    List<String> imagePaths =
        ref.read(homeControllerProvider).getTumbImage(widget.item!.images);

    //loading gallery images
    imagePaths.forEach((element) async {
      await _fileFromImageUrl(element).then((value) =>
          {ref.read(imageGalleryProvider).add(ImageObject(path: value.path))});
    });
    imagePaths.forEach((element) async {
      ref.read(imageNameGalleryProvider).add(element.substring(18));
    });
    print(ref.read(imageNameGalleryProvider));
    print(ref.read(mainImageNameProvider));

    _cat = item!.main_category ?? 'Select one';
    _gender = widget.item!.gender ?? 'Select one';
    _subCat = widget.item!.category ?? 'Select one';
    _location = widget.item!.main_location ?? 'Select one';
    _subLocation = widget.item!.location ?? 'Select one';
    _alwaysOpen = widget.item!.always_open ?? 'Select one';
    _openInHollyday = widget.item!.open_holiday ?? 'Select one';
    _mondayOpen = widget.item!.monday_open_time ?? 'Select one';
    _mondayClose = widget.item!.monday_close_time ?? 'Select one';
    _tuesdayOpen = widget.item!.tuesday_open_time ?? 'Select one';
    _tuesdayClose = widget.item!.tuesday_close_time ?? 'Select one';
    _wednesdayOpen = widget.item!.wednesday_open_time ?? 'Select one';
    _wednesdayClose = widget.item!.wednesday_close_time ?? 'Select one';
    _thursdayOpen = widget.item!.thursday_open_time ?? 'Select one';
    _thursdayClose = widget.item!.thursday_close_time ?? 'Select one';
    _fridayOpen = widget.item!.friday_open_time ?? 'Select one';
    _fridayClose = widget.item!.friday_close_time ?? 'Select one';
    _saturedayOpen = widget.item!.saturday_open_time ?? 'Select one';
    _saturedayClose = widget.item!.saturday_close_time ?? 'Select one';
    _sundayOpen = widget.item!.sunday_open_time ?? 'Select one';
    _sundayClose = widget.item!.sunday_close_time ?? 'Select one';

    _genderData = widget.item!.gender ?? 'Select one';
    _heightData = widget.item!.height ?? 'Select one';
    _weightData = widget.item!.weight ?? 'Select one';
    _bodyData = widget.item!.body ?? 'Select one';
    _appearanceData = widget.item!.appearance ?? 'Select one';
    _complexionData = widget.item!.complexion ?? 'Select one';
    _maritalStatusData = widget.item!.maritial ?? 'Select one';
    _eduData = widget.item!.education ?? 'Select one';
    _carrerData = widget.item!.career ?? 'Select one';
    _religionData = widget.item!.religion ?? 'Select one';
    _ethnicityData = widget.item!.ethnicity ?? 'Select one';
    _socialClassData = widget.item!.social_class ?? 'Select one';
    _residencyData = widget.item!.residency ?? 'Select one';
    _familyValuesData = widget.item!.family_values ?? 'Select one';
    _smokingData = widget.item!.smoking ?? 'Select one';
    _drinkingData = widget.item!.drinking ?? 'Select one';
    _dietData = widget.item!.diet ?? 'Select one';
    _personalityData = widget.item!.personality ?? 'Select one';
    _nextStepData = widget.item!.next_step ?? 'Select one';

    am1 = stringAmenities.contains("Elevator in Building") ? true : false;
    am2 = stringAmenities.contains("Friendly Workspace") ? true : false;
    am3 = stringAmenities.contains("Instant Book") ? true : false;
    am4 = stringAmenities.contains("Wifi") ? true : false;
    am5 = stringAmenities.contains("Free Parking on Premises") ? true : false;
    am6 = stringAmenities.contains("Free Parking on Street") ? true : false;
    am7 = stringAmenities.contains("Smoking allowed") ? true : false;
    am8 = stringAmenities.contains("Events") ? true : false;
    am9 = stringAmenities.contains("Electricity") ? true : false;
    am10 = stringAmenities.contains("Security Cameras") ? true : false;
    am11 = stringAmenities.contains("Intercom") ? true : false;
    am12 = stringAmenities.contains("Door Attendant") ? true : false;

    askPrice = widget.item!.ask_price == "1" ? true : false;
    negotiable = widget.item!.negotiable == "1" ? true : false;
    _dobController.text =
        '${widget.item!.birthday}/${widget.item!.birthmonth}/${widget.item!.birthyear}';

    //To add exist amenities
    amenities.addAll(stringAmenities);

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider).user;
    final controller = ref.watch(postControllerProvider);
    final state = ref.watch(addListingViewStateProvider);
    List<S2Choice<String>>? mainCategoryData = ref
        .watch(categoriesProvider)
        .map((e) => S2Choice<String>(
            value: e.category.toString(), title: e.category.toString()))
        .toList();
    List<S2Choice<String>>? mainLocationData = ref
        .watch(locationsProvider)
        .map((e) => S2Choice<String>(
            value: e.location_en.toString(), title: e.location_en.toString()))
        .toList();

    imageUpload(File image, String name, String type) async {
      if (type == "gallery") {
        ref.read(isLoadingGalleryProvider.notifier).state = true;
      } else {
        ref.read(isLoadingMainImageProvider.notifier).state = true;
      }

      final res = await controller.imageUpload(image, name, type);
      print(res);
      setState(() {
        if (res['responseCode'].toString() == "1") {
          if (type == "gallery") {
            ref.read(imageNameGalleryProvider).add(res['imageUrl'].toString());
            ref.read(isLoadingGalleryProvider.notifier).state = false;
          } else {
            ref.read(mainImageNameProvider.notifier).state =
                res['imageUrl'].toString();
            ref.read(isLoadingMainImageProvider.notifier).state = false;
          }
          print(ref.read(imageNameGalleryProvider));
          print(ref.read(mainImageNameProvider));
        }
      });
    }

    ref.listen<AsyncValue>(addListingViewStateProvider, (_, state) {
      state.whenData((items) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Successfully publishing!',
            message: items,
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: ViwahaColor.primary,
          ),
        );
        (items == null ? null : ScaffoldMessenger.of(context))!
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      });
    });

    return LoadingOverlay(
      isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        child: Assets.lib.assets.images.logo.image(),
                      ),
                    ),
                  ],
                ),
              ],
              title: const Text('Edit Listing'),
            ),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddFieldMainWidget(
                        icon: Icons.info_outline,
                        title: LocaleKeys.general_info,
                        description: "General information about your self",
                        inputList: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: _catColor),
                              ),
                              child: SmartSelect<String>.single(
                                title: 'Category *',
                                selectedValue: _cat,
                                choiceItems: mainCategoryData,
                                onChange: (selected) {
                                  setState(() {
                                    _cat = selected.value;
                                    subCategoryData = ref
                                        .watch(categoriesProvider)
                                        .where((element) =>
                                            element.category == selected.value)
                                        .first
                                        .sub_categories!
                                        .map((e) => S2Choice<String>(
                                            value: e!.sub_category.toString(),
                                            title: e.sub_category
                                                .toString()
                                                .toString()))
                                        .toList();
                                    _catColor = Colors.grey;
                                  });
                                },
                                modalType: S2ModalType.bottomSheet,
                                tileBuilder: (context, state) {
                                  return ListTile(
                                    title: Text(
                                      state.title.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    subtitle: Text(_cat),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_down),
                                    onTap: state.showModal,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: _subCatColor),
                              ),
                              child: SmartSelect<String>.single(
                                title: 'Sub Category *',
                                selectedValue: _subCat,
                                choiceItems: subCategoryData,
                                onChange: (selected) {
                                  setState(() {
                                    _subCat = selected.value;
                                    _subCatColor = Colors.grey;
                                  });
                                },
                                modalType: S2ModalType.bottomSheet,
                                tileBuilder: (context, state) {
                                  return ListTile(
                                    title: Text(
                                      state.title.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    subtitle: Text(_subCat),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_down),
                                    onTap: state.showModal,
                                  );
                                },
                              ),
                            ),
                          ),
                          _cat != 'Proposal'
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adTitleProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.title != null
                                        ? widget.item!.title.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This name will appear on your ad.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Ad Title',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "AD Title can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ]),
                    _cat == 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.perm_contact_cal_sharp,
                            title: "Basic Details",
                            description:
                                "Take the 1st step to your happy marriage",
                            inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(proposerNameProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.name != null
                                        ? widget.item!.name.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This name will appear on your ad.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Name',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Proposer name can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: _genderColor),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'I am a',
                                      selectedValue: _gender,
                                      choiceItems: genderData,
                                      onChange: (selected) {
                                        setState(() {
                                          _gender = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_gender),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: _dobController,
                                    // initialValue:  '2018/7/7',
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2101));
                                      if (pickedDate != null) {
                                        String formattedDate =
                                            Jiffy.parse(pickedDate.toString())
                                                .format(pattern: 'yyyy-MM-dd');

                                        setState(() {
                                          _dobController.text = formattedDate;
                                          ref
                                                  .read(proposerDobProvider
                                                      .notifier)
                                                  .state =
                                              DateTime.parse(formattedDate);
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This date will appear on your ad.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Born on',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Proposer DOB can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adEmailProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.email != null
                                        ? widget.item!.email.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Email address",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Email',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Proposer email can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adPhoneProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.phone != null
                                        ? widget.item!.phone.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Phone number",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Phone',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Proposer phone number can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adWhatsappProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.whatsapp != null
                                        ? widget.item!.whatsapp.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Ex:0710000000",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Whatsapp (without +94)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                              ])
                        : const SizedBox(),
                    AddFieldMainWidget(
                        icon: Icons.location_searching_outlined,
                        title: "Add Location",
                        description:
                            "Address information about your listing location",
                        inputList: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: _locationColor),
                              ),
                              child: SmartSelect<String>.single(
                                title: 'District',
                                selectedValue: _location,
                                choiceItems: mainLocationData,
                                onChange: (selected) {
                                  setState(() {
                                    _location = selected.value;
                                    subLocationData = ref
                                        .watch(locationsProvider)
                                        .where((element) =>
                                            element.location_en ==
                                            selected.value)
                                        .first
                                        .sub_locations!
                                        .map((e) => S2Choice<String>(
                                            value:
                                                e!.sub_location_en.toString(),
                                            title: e.sub_location_en
                                                .toString()
                                                .toString()))
                                        .toList();
                                  });
                                },
                                modalType: S2ModalType.bottomSheet,
                                tileBuilder: (context, state) {
                                  return ListTile(
                                    title: Text(
                                      state.title.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    subtitle: Text(_location),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_down),
                                    onTap: state.showModal,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: _subLocationColor),
                              ),
                              child: SmartSelect<String>.single(
                                title: 'City',
                                selectedValue: _subLocation,
                                choiceItems: subLocationData,
                                onChange: (selected) {
                                  setState(() {
                                    _subLocation = selected.value;
                                  });
                                },
                                modalType: S2ModalType.bottomSheet,
                                tileBuilder: (context, state) {
                                  return ListTile(
                                    title: Text(
                                      state.title.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    subtitle: Text(_subLocation),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_down),
                                    onTap: state.showModal,
                                  );
                                },
                              ),
                            ),
                          ),
                          _cat != 'Proposal'
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adAddressProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.address != null
                                        ? widget.item!.address.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Your bussiness address",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Address',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                )
                              : const SizedBox(),
                          _cat != 'Proposal'
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adGoogleAddressProvider
                                                .notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.googleplace !=
                                            null
                                        ? widget.item!.googleplace.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Your google bussiness address",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Google Location Address',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                )
                              : const SizedBox(),
                        ]),
                    _cat != 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.menu_book_outlined,
                            title: "Full Details",
                            description:
                                "Write full details information about listing",
                            inputList: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adPriceProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.price != null
                                        ? widget.item!.price.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Price range - LKR 0.00",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Price',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: askPrice,
                                      onChanged: (value) {
                                        setState(() {
                                          askPrice = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Ask Price ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: negotiable,
                                      onChanged: (value) {
                                        setState(() {
                                          negotiable = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Negotiable ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adOwnerNameProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue:
                                        '${user!.firstname} ${user.lastname}',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Your name",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Owner Name',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adEmailProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.email != null
                                        ? widget.item!.email.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Email address",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Email',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adPhoneProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.phone != null
                                        ? widget.item!.phone.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Phone number",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Phone',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adWhatsappProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.whatsapp != null
                                        ? widget.item!.whatsapp.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Ex:0710000000",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Whatsapp (without +94)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(
                                                adDesignationProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.designation !=
                                            null
                                        ? widget.item!.designation.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Your position",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Designation (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adCompanyProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.company != null
                                        ? widget.item!.company.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "Your company Name",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Company (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adWebSiteProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.website != null
                                        ? widget.item!.website.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon

                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://www.example.com",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Website (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adFacebookProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.facebook != null
                                        ? widget.item!.facebook.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://www.facebook.com",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Facebook (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adInstagramProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.instagram != null
                                        ? widget.item!.instagram.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://wwww.instagram.com",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Instagram (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adYoutubeProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.youtube != null
                                        ? widget.item!.youtube.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://www.youtube.com",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Youtube (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adLinkedinProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.linkedin != null
                                        ? widget.item!.linkedin.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://linkedin.com",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Linkedin (optional)',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adDescProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.description !=
                                            null
                                        ? widget.item!.description.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "Write something about your Ad informations",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Description',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    // validator: null,
                                  ),
                                ),
                              ])
                        : const SizedBox(),
                    _cat != 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.card_giftcard_outlined,
                            title: "Amenities",
                            description:
                                "Check full detail information aboutfacilities",
                            inputList: [
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am1,
                                      onChanged: (value) {
                                        setState(() {
                                          am1 = value!;
                                          if (value) {
                                            amenities
                                                .add('Elevator in Building');
                                          } else {
                                            amenities
                                                .remove('Elevator in Building');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Elevator in Building ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am2,
                                      onChanged: (value) {
                                        setState(() {
                                          am2 = value!;
                                          if (value) {
                                            amenities.add('Friendly Workspace');
                                          } else {
                                            amenities
                                                .remove('Friendly Workspace');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Friendly Workspace ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am3,
                                      onChanged: (value) {
                                        setState(() {
                                          am3 = value!;
                                          if (value) {
                                            amenities.add('Instant Book');
                                          } else {
                                            amenities.remove('Instant Book');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Instant Book ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am4,
                                      onChanged: (value) {
                                        setState(() {
                                          am4 = value!;
                                          if (value) {
                                            amenities.add('Wifi');
                                          } else {
                                            amenities.remove('Wifi');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Wifi ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am5,
                                      onChanged: (value) {
                                        setState(() {
                                          am5 = value!;
                                          if (value) {
                                            amenities.add(
                                                'Free Parking on Premises');
                                          } else {
                                            amenities.remove(
                                                'Free Parking on Premises');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Free Parking on Premises ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am6,
                                      onChanged: (value) {
                                        setState(() {
                                          am6 = value!;
                                          if (value) {
                                            amenities
                                                .add('Free Parking on Street');
                                          } else {
                                            amenities.remove(
                                                'Free Parking on Street');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Free Parking on Street ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am7,
                                      onChanged: (value) {
                                        setState(() {
                                          am7 = value!;
                                          if (value) {
                                            amenities.add('Smoking allowed');
                                          } else {
                                            amenities.remove('Smoking allowed');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Smoking allowed ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am8,
                                      onChanged: (value) {
                                        setState(() {
                                          am8 = value!;
                                          if (value) {
                                            amenities.add('Events');
                                          } else {
                                            amenities.remove('Events');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Events ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am9,
                                      onChanged: (value) {
                                        setState(() {
                                          am9 = value!;
                                          if (value) {
                                            amenities.add('Electricity');
                                          } else {
                                            amenities.remove('Electricity');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Electricity ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am10,
                                      onChanged: (value) {
                                        setState(() {
                                          am10 = value!;
                                          if (value) {
                                            amenities.add('Security Cameras');
                                          } else {
                                            amenities
                                                .remove('Security Cameras');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Security Cameras ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am11,
                                      onChanged: (value) {
                                        setState(() {
                                          am11 = value!;
                                          if (value) {
                                            amenities.add('Intercom');
                                          } else {
                                            amenities.remove('Intercom');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Intercom ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: am12,
                                      onChanged: (value) {
                                        setState(() {
                                          am12 = value!;
                                          if (value) {
                                            amenities.add('Door Attendant');
                                          } else {
                                            amenities.remove('Door Attendant');
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Door Attendant ',
                                      style: TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                              ])
                        : const SizedBox(),
                    AddFieldMainWidget(
                        icon: Icons.image_sharp,
                        title: "Main Image ",
                        description:
                            "[Valid formats : jpg, jpeg, png][Max size : 5Mb] NOTE: If you upload image here, this will be thumbnail image",
                        inputList: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    File image;
                                    picker
                                        .pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 50,
                                            maxWidth: 800,
                                            maxHeight: 800)
                                        .then((value) => {
                                              if (value != null)
                                                {
                                                  image = File(value.path),
                                                  imageUpload(image, value.name,
                                                      "main"),
                                                  ref
                                                      .read(mainImageProvider
                                                          .notifier)
                                                      .state = image.path,
                                                }
                                            });
                                  },
                                  child: Container(
                                    color: ViwahaColor.transparent,
                                    width: 50,
                                    height: 50,
                                    child: Assets.lib.assets.images.photography
                                        .image(),
                                  ),
                                ),
                                ref.watch(isLoadingMainImageProvider)
                                    ? Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ViwahaColor.primary),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: const Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    : ref.watch(mainImageProvider) == ""
                                        ? Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: ViwahaColor.primary),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Assets
                                                .lib.assets.images.colorLogo
                                                .image(),
                                          )
                                        : Stack(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: Image.file(File(
                                                                ref.watch(
                                                                    mainImageProvider)))
                                                            .image),
                                                    border: Border.all(
                                                        color: ViwahaColor
                                                            .primary),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      ref
                                                          .watch(
                                                              mainImageProvider
                                                                  .notifier)
                                                          .state = "";
                                                      ref
                                                          .watch(
                                                              mainImageNameProvider
                                                                  .notifier)
                                                          .state = "";
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                              ],
                            ),
                          )
                        ]),
                    AddFieldMainWidget(
                        icon: Icons.image_search,
                        title: "Add Gallery ",
                        description:
                            "NOTE: First uploaded image will be the thumbnail image ",
                        inputList: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    File image;
                                    picker
                                        .pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 50,
                                            maxWidth: 800,
                                            maxHeight: 800)
                                        .then((value) => {
                                              if (value != null)
                                                {
                                                  image = File(value.path),
                                                  imageUpload(image, value.name,
                                                      "gallery"),
                                                  setState(() {
                                                    ref
                                                        .read(
                                                            imageGalleryProvider)
                                                        .add(ImageObject(
                                                            path: value.path));
                                                  })
                                                }
                                            });
                                  },
                                  child: Container(
                                    color: ViwahaColor.transparent,
                                    width: 50,
                                    height: 50,
                                    child: Assets.lib.assets.images.photography
                                        .image(),
                                  ),
                                ),
                                ref.watch(isLoadingGalleryProvider)
                                    ? const Center(
                                        child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(),
                                      ))
                                    : ref.watch(imageGalleryProvider).isEmpty
                                        ? const SizedBox()
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: ref
                                                    .watch(imageGalleryProvider)
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    child: Stack(children: [
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: Image.file(File(ref
                                                                        .watch(imageGalleryProvider)[
                                                                            index]
                                                                        .path
                                                                        .toString()))
                                                                    .image),
                                                            border: Border.all(
                                                                color: ViwahaColor
                                                                    .primary),
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(10))),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 20,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              ref.read(imageNameGalleryProvider).removeWhere((element) =>
                                                                  element
                                                                      .substring(
                                                                          16) ==
                                                                  ref
                                                                      .read(imageGalleryProvider)[
                                                                          index]
                                                                      .path!
                                                                      .toString()
                                                                      .substring(
                                                                          42));
                                                              ref
                                                                  .read(
                                                                      imageGalleryProvider)
                                                                  .removeAt(
                                                                      index);
                                                            });
                                                            print(ref.read(
                                                                imageGalleryProvider));
                                                            print(ref.read(
                                                                imageNameGalleryProvider));
                                                          },
                                                          child: const Icon(
                                                            Icons.remove_circle,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  );
                                                }),
                                          )
                              ],
                            ),
                          )
                        ]),
                    _cat != 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.video_camera_back_outlined,
                            title: "Add Video",
                            description:
                                "Copy and paste the youtube or facebook video link",
                            inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adVideoLinkProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.video != null
                                        ? widget.item!.video.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://youtube.com/video",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Youtube video link',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                              ])
                        : const SizedBox(),
                    _cat == 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.document_scanner_outlined,
                            title: "Proposal Details",
                            description:
                                "Write full detail information about you",
                            inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Height',
                                      selectedValue: _heightData,
                                      choiceItems: heightData,
                                      onChange: (selected) {
                                        setState(() {
                                          _heightData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_heightData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Weight',
                                      selectedValue: _weightData,
                                      choiceItems: weightData,
                                      onChange: (selected) {
                                        setState(() {
                                          _weightData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_weightData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'body',
                                      selectedValue: _bodyData,
                                      choiceItems: bodyData,
                                      onChange: (selected) {
                                        setState(() {
                                          _bodyData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_bodyData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Appearance',
                                      selectedValue: _appearanceData,
                                      choiceItems: appearanceData,
                                      onChange: (selected) {
                                        setState(() {
                                          _appearanceData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_appearanceData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Complexion',
                                      selectedValue: _complexionData,
                                      choiceItems: complexionData,
                                      onChange: (selected) {
                                        setState(() {
                                          _complexionData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_complexionData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Marital Status',
                                      selectedValue: _maritalStatusData,
                                      choiceItems: maritalStatusData,
                                      onChange: (selected) {
                                        setState(() {
                                          _maritalStatusData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_maritalStatusData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Education',
                                      selectedValue: _eduData,
                                      choiceItems: eduData,
                                      onChange: (selected) {
                                        setState(() {
                                          _eduData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_eduData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Career',
                                      selectedValue: _carrerData,
                                      choiceItems: carrerData,
                                      onChange: (selected) {
                                        setState(() {
                                          _carrerData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_carrerData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Religion',
                                      selectedValue: _religionData,
                                      choiceItems: religionData,
                                      onChange: (selected) {
                                        setState(() {
                                          _religionData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_religionData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Ethnicity',
                                      selectedValue: _ethnicityData,
                                      choiceItems: ethnicityData,
                                      onChange: (selected) {
                                        setState(() {
                                          _ethnicityData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_ethnicityData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Social Class',
                                      selectedValue: _socialClassData,
                                      choiceItems: socialClassData,
                                      onChange: (selected) {
                                        setState(() {
                                          _socialClassData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_socialClassData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Residency',
                                      selectedValue: _residencyData,
                                      choiceItems: residencyData,
                                      onChange: (selected) {
                                        setState(() {
                                          _residencyData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_residencyData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Family Values',
                                      selectedValue: _familyValuesData,
                                      choiceItems: familyValuesData,
                                      onChange: (selected) {
                                        setState(() {
                                          _familyValuesData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_familyValuesData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Smoking',
                                      selectedValue: _smokingData,
                                      choiceItems: smokingData,
                                      onChange: (selected) {
                                        setState(() {
                                          _smokingData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_smokingData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Drinking',
                                      selectedValue: _drinkingData,
                                      choiceItems: drinkingData,
                                      onChange: (selected) {
                                        setState(() {
                                          _drinkingData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_drinkingData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Diet',
                                      selectedValue: _dietData,
                                      choiceItems: dietData,
                                      onChange: (selected) {
                                        setState(() {
                                          _dietData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_dietData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Personality',
                                      selectedValue: _personalityData,
                                      choiceItems: personalityData,
                                      onChange: (selected) {
                                        setState(() {
                                          _personalityData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_personalityData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Next Step',
                                      selectedValue: _nextStepData,
                                      choiceItems: nextStepData,
                                      onChange: (selected) {
                                        setState(() {
                                          _nextStepData = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_nextStepData),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adDescProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.description !=
                                            null
                                        ? widget.item!.description.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "Write something about your Ad informations",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Your Proposal Description',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Description can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ])
                        : const SizedBox(),
                    _cat == 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.person_pin_rounded,
                            title: "Social Media Links",
                            description: "Links for you social media profiles",
                            inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adFacebookProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.facebook != null
                                        ? widget.item!.facebook.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://facebook.com/",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Facebook',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adInstagramProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.instagram != null
                                        ? widget.item!.instagram.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://instagram.com/",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Instagram',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adYoutubeProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.youtube != null
                                        ? widget.item!.youtube.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://youtube.com/",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Youtube',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(adLinkedinProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: widget.item!.linkedin != null
                                        ? widget.item!.linkedin.toString()
                                        : '',
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText: "https://linkedIn.com/",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'LinkedIn',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                              ])
                        : const SizedBox(),
                    _cat != 'Proposal'
                        ? AddFieldMainWidget(
                            icon: Icons.share_arrival_time_outlined,
                            title: "Opening Hours",
                            description:
                                "Select full detail information about opening time",
                            inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Always Open',
                                      selectedValue: _alwaysOpen,
                                      choiceItems: [
                                        S2Choice<String>(
                                            title: 'No', value: 'No'),
                                        S2Choice<String>(
                                            title: 'Yes', value: 'Yes')
                                      ],
                                      onChange: (selected) {
                                        setState(() {
                                          _alwaysOpen = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_alwaysOpen),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: SmartSelect<String>.single(
                                      title: 'Open in holidays',
                                      selectedValue: _openInHollyday,
                                      choiceItems: [
                                        S2Choice<String>(
                                            title: 'No', value: 'No'),
                                        S2Choice<String>(
                                            title: 'Yes', value: 'Yes')
                                      ],
                                      onChange: (selected) {
                                        setState(() {
                                          _openInHollyday = selected.value;
                                        });
                                      },
                                      modalType: S2ModalType.bottomSheet,
                                      tileBuilder: (context, state) {
                                        return ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_openInHollyday),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _mondayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _mondayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle: Text(_mondayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _mondayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _mondayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_mondayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Monday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _tuesdayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _tuesdayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_tuesdayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _tuesdayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _tuesdayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_tuesdayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Tuesday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _wednesdayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _wednesdayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_wednesdayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _wednesdayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _wednesdayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_wednesdayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Wednesday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _thursdayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _thursdayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_thursdayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _thursdayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _thursdayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_thursdayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Thursday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _fridayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _fridayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle: Text(_fridayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _fridayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _fridayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_fridayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Friday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _saturedayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _saturedayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_saturedayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _saturedayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _saturedayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_saturedayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Saturday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ViwahaColor.primary,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Opening Time',
                                                selectedValue: _sundayOpen,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _sundayOpen =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle: Text(_sundayOpen),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: SmartSelect<String>.single(
                                                title: 'Closing Time',
                                                selectedValue: _sundayClose,
                                                choiceItems: timeData,
                                                onChange: (selected) {
                                                  setState(() {
                                                    _sundayClose =
                                                        selected.value;
                                                  });
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                tileBuilder: (context, state) {
                                                  return ListTile(
                                                    title: Text(
                                                      state.title.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    subtitle:
                                                        Text(_sundayClose),
                                                    trailing: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    onTap: state.showModal,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      top: 12,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        color: Colors.white,
                                        child: const Text(
                                          'Sunday',
                                          style: TextStyle(
                                              color: ViwahaColor.primary,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ])
                        : const SizedBox(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else if (_cat != 'Proposal') {
                                if (askPrice == false ||
                                    ref.watch(imageGalleryProvider).isEmpty) {
                                  setState(() {
                                    _askPriceColor = Colors.red;
                                    _galleryImgColor = Colors.red;
                                    _thumbImgColor = Colors.red;
                                  });
                                  SnackBar snackBar = SnackBar(
                                    content: const Text(
                                        'Please make sure to fill in all the required fields.',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor: ViwahaColor.primary,
                                    dismissDirection: DismissDirection.up,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height -
                                                170,
                                        left: 50,
                                        right: 50),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  ref
                                      .read(
                                          addListingViewStateProvider.notifier)
                                      .state = const AsyncValue.loading();

                                  var newList = {
                                    "userId": ref.read(userProvider).user!.id,
                                    "title": ref.read(adTitleProvider) != ''
                                        ? ref.read(adTitleProvider)
                                        : widget.item!.title,
                                    "category": _subCat,
                                    "address": ref.read(adAddressProvider) != ''
                                        ? ref.read(adAddressProvider)
                                        : widget.item!.address,
                                    "location": _subLocation,
                                    "googleplace":
                                        ref.read(adGoogleAddressProvider) != ''
                                            ? ref.read(adGoogleAddressProvider)
                                            : widget.item!.address,
                                    "video": ref.read(adVideoLinkProvider) != ''
                                        ? ref.read(adVideoLinkProvider)
                                        : widget.item!.video,
                                    "video1": "",
                                    "video2": "",
                                    "video3": "",
                                    "video4": "",
                                    "video5": "",
                                    "name": ref.read(adOwnerNameProvider) != ''
                                        ? ref.read(adOwnerNameProvider)
                                        : widget.item!.name,
                                    "email": ref.read(adEmailProvider) != ''
                                        ? ref.read(adEmailProvider)
                                        : widget.item!.email,
                                    "phone": ref.read(adPhoneProvider) != ''
                                        ? ref.read(adPhoneProvider)
                                        : widget.item!.phone,
                                    "whatsapp":
                                        ref.read(adWhatsappProvider) != ''
                                            ? ref.read(adWhatsappProvider)
                                            : widget.item!.whatsapp,
                                    "website": ref.read(adWebSiteProvider) != ''
                                        ? ref.read(adWebSiteProvider)
                                        : widget.item!.website,
                                    "designation":
                                        ref.read(adDesignationProvider) != ''
                                            ? ref.read(adDesignationProvider)
                                            : widget.item!.designation,
                                    "amenities": amenities.toString(),
                                    "company": ref.read(adCompanyProvider) != ''
                                        ? ref.read(adCompanyProvider)
                                        : widget.item!.company,
                                    "facebook":
                                        ref.read(adFacebookProvider) != ''
                                            ? ref.read(adFacebookProvider)
                                            : widget.item!.facebook,
                                    "instagram":
                                        ref.read(adInstagramProvider) != ''
                                            ? ref.read(adInstagramProvider)
                                            : widget.item!.instagram,
                                    "youtube": ref.read(adYoutubeProvider) != ''
                                        ? ref.read(adYoutubeProvider)
                                        : widget.item!.youtube,
                                    "linkedin":
                                        ref.read(adLinkedinProvider) != ''
                                            ? ref.read(adLinkedinProvider)
                                            : widget.item!.linkedin,
                                    "description":
                                        ref.read(adDescProvider) != ''
                                            ? ref.read(adDescProvider)
                                            : widget.item!.description,
                                    "saturdayOpenTime":
                                        _saturedayOpen == "Select one"
                                            ? ""
                                            : _saturedayOpen,
                                    "saturdayCloseTime":
                                        _saturedayClose == "Select one"
                                            ? ""
                                            : _saturedayClose,
                                    "sundayOpenTime":
                                        _sundayOpen == "Select one"
                                            ? ""
                                            : _sundayOpen,
                                    "sundayCloseTime":
                                        _sundayClose == "Select one"
                                            ? ""
                                            : _sundayClose,
                                    "mondayOpenTime":
                                        _mondayOpen == "Select one"
                                            ? ""
                                            : _mondayOpen,
                                    "mondayCloseTime":
                                        _mondayClose == "Select one"
                                            ? ""
                                            : _mondayClose,
                                    "tuesdayOpenTime":
                                        _tuesdayOpen == "Select one"
                                            ? ""
                                            : _tuesdayOpen,
                                    "tuesdayCloseTime":
                                        _tuesdayClose == "Select one"
                                            ? ""
                                            : _tuesdayClose,
                                    "wednesdayOpenTime":
                                        _wednesdayOpen == "Select one"
                                            ? ""
                                            : _wednesdayOpen,
                                    "wednesdayCloseTime":
                                        _wednesdayClose == "Select one"
                                            ? ""
                                            : _wednesdayClose,
                                    "thursdayOpenTime":
                                        _thursdayOpen == "Select one"
                                            ? ""
                                            : _thursdayOpen,
                                    "thursdayCloseTime":
                                        _thursdayClose == "Select one"
                                            ? ""
                                            : _thursdayClose,
                                    "fridayOpenTime":
                                        _fridayOpen == "Select one"
                                            ? ""
                                            : _fridayOpen,
                                    "fridayCloseTime":
                                        _fridayClose == "Select one"
                                            ? ""
                                            : _fridayClose,
                                    "alwaysOpen": _alwaysOpen == "Select one"
                                        ? ""
                                        : _alwaysOpen,
                                    "openHoliday":
                                        _openInHollyday == "Select one"
                                            ? ""
                                            : _openInHollyday,
                                    "mainLocation": _location,
                                    "mainCategory": _cat,
                                    "price": ref.read(adPriceProvider) != ''
                                        ? ref.read(adPriceProvider)
                                        : widget.item!.price,
                                    "askPrice": askPrice == false ? 0 : 1,
                                    "negotiable": negotiable == false ? 0 : 1,
                                    "duplicate": "",
                                    "uniqueImageName11": "",
                                    "gallery_images":
                                        ref.read(imageNameGalleryProvider),
                                    "file1": ref.read(mainImageNameProvider)
                                  };
                                  controller.editListing(
                                      newList, widget.item!.id);
                                }
                              } else {
                                if (ref.watch(imageGalleryProvider).isEmpty) {
                                  setState(() {
                                    _galleryImgColor = Colors.red;
                                    _thumbImgColor = Colors.red;
                                  });
                                  SnackBar snackBar = SnackBar(
                                    content: const Text(
                                        'Please make sure to fill in all the required fields.',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white)),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor: ViwahaColor.primary,
                                    dismissDirection: DismissDirection.up,
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height -
                                                170,
                                        left: 50,
                                        right: 50),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  _formKey.currentState!.save();
                                  Map<String, Object?> newList;
                                  ref
                                      .read(
                                          addListingViewStateProvider.notifier)
                                      .state = const AsyncValue.loading();

                                  newList = {
                                    "name": ref.read(proposerNameProvider) != ''
                                        ? ref.read(proposerNameProvider)
                                        : widget.item!.name,
                                    "userId": ref.read(userProvider).user!.id,
                                    "gender": _gender != 'Select one'
                                        ? _gender
                                        : widget.item!.gender,
                                    "category": _subCat != 'Select one'
                                        ? _subCat
                                        : widget.item!.category,
                                    "mainCategory": _cat != 'Select one'
                                        ? _cat
                                        : widget.item!.main_category,
                                    "location": _subLocation != 'Select one'
                                        ? _subLocation
                                        : widget.item!.location,
                                    "mainLocation": _location != 'Select one'
                                        ? _location
                                        : widget.item!.main_location,
                                    "birthday":
                                        ref.read(proposerDobProvider).day.isNaN
                                            ? ref.read(proposerDobProvider).day
                                            : widget.item!.birthday,
                                    "birthmonth": ref
                                            .read(proposerDobProvider)
                                            .month
                                            .isNaN
                                        ? ref.read(proposerDobProvider).day
                                        : widget.item!.birthmonth,
                                    "birthyear":
                                        ref.read(proposerDobProvider).year.isNaN
                                            ? ref.read(proposerDobProvider).day
                                            : widget.item!.birthyear,
                                    "height": _heightData != 'Select one'
                                        ? _heightData
                                        : widget.item!.height,
                                    "weight": _weightData != 'Select one'
                                        ? _weightData
                                        : widget.item!.weight,
                                    "body": _bodyData != 'Select one'
                                        ? _bodyData
                                        : widget.item!.body,
                                    "appearance":
                                        _appearanceData != 'Select one'
                                            ? _appearanceData
                                            : widget.item!.appearance,
                                    "complexion":
                                        _complexionData != 'Select one'
                                            ? _complexionData
                                            : widget.item!.complexion,
                                    "maritial":
                                        _maritalStatusData != 'Select one'
                                            ? _maritalStatusData
                                            : widget.item!.maritial,
                                    "education": _eduData != 'Select one'
                                        ? _eduData
                                        : widget.item!.education,
                                    "career": _carrerData != 'Select one'
                                        ? _carrerData
                                        : widget.item!.career,
                                    "religion": _religionData != 'Select one'
                                        ? _religionData
                                        : widget.item!.religion,
                                    "ethnicity": _ethnicityData != 'Select one'
                                        ? _ethnicityData
                                        : widget.item!.ethnicity,
                                    "social_class":
                                        _socialClassData != 'Select one'
                                            ? _socialClassData
                                            : widget.item!.social_class,
                                    "residency": _residencyData != 'Select one'
                                        ? _residencyData
                                        : widget.item!.residency,
                                    "family_values":
                                        _familyValuesData != 'Select one'
                                            ? _familyValuesData
                                            : widget.item!.family_values,
                                    "smoking": _smokingData != 'Select one'
                                        ? _smokingData
                                        : widget.item!.smoking,
                                    "drinking": _drinkingData != 'Select one'
                                        ? _drinkingData
                                        : widget.item!.drinking,
                                    "diet": _dietData != 'Select one'
                                        ? _dietData
                                        : widget.item!.diet,
                                    "personality":
                                        _personalityData != 'Select one'
                                            ? _personalityData
                                            : widget.item!.personality,
                                    "next_step": _nextStepData != 'Select one'
                                        ? _nextStepData
                                        : widget.item!.next_step,
                                    "facebook":
                                        ref.read(adFacebookProvider) != ''
                                            ? ref.read(adFacebookProvider)
                                            : widget.item!.facebook,
                                    "instagram":
                                        ref.read(adInstagramProvider) != ''
                                            ? ref.read(adInstagramProvider)
                                            : widget.item!.instagram,
                                    "youtube": ref.read(adYoutubeProvider) != ''
                                        ? ref.read(adYoutubeProvider)
                                        : widget.item!.youtube,
                                    "linkedin":
                                        ref.read(adLinkedinProvider) != ''
                                            ? ref.read(adLinkedinProvider)
                                            : widget.item!.linkedin,
                                    "description":
                                        ref.read(adDescProvider) != ''
                                            ? ref.read(adDescProvider)
                                            : widget.item!.description,
                                    "email": ref.read(adEmailProvider) != ''
                                        ? ref.read(adEmailProvider)
                                        : widget.item!.email,
                                    "phone": ref.read(adPhoneProvider) != ''
                                        ? ref.read(adPhoneProvider)
                                        : widget.item!.phone,
                                    "whatsapp":
                                        ref.read(adWhatsappProvider) != ''
                                            ? ref.read(adWhatsappProvider)
                                            : widget.item!.whatsapp,
                                    "gallery_images":
                                        ref.read(imageNameGalleryProvider),
                                    "file1": ref.read(mainImageNameProvider)
                                  };

                                  controller.editListing(
                                      newList, widget.item!.id);
                                }
                              }
                              print(ref.read(imageNameGalleryProvider));
                              // print(ref.read(mainImageNameProvider));

                              // PostData.addNewListing(newList);
                            },
                            icon: const Icon(Icons.add_box_outlined),
                            label: const Text('ADD YOUR LISTING'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
