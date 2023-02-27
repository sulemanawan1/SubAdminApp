import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddEvent/View/add_event.dart';
import 'package:societyadminapp/Module/AddEvent/View/update_event.dart';
import 'package:societyadminapp/Module/AddGateKepeer/View/add_gatekepeer.dart';
import 'package:societyadminapp/Module/AddNoticeBoard/View/add_notice_board_screen.dart';

import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Blocks/View/add_blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Houses/View/add_houses.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Streets/View/add_streets.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/View/blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/View/streets.dart';
import 'package:societyadminapp/Module/AdminProfile/View/admin_profile_screen.dart';
import 'package:societyadminapp/Module/Events/View/events_screen.dart';
import 'package:societyadminapp/Module/Events/View/view_event_images_screen.dart';
import 'package:societyadminapp/Module/GateKepeer/View/gate_keeper_screen.dart';
import 'package:societyadminapp/Module/Generate%20Bill/View/generate_bill.dart';
import 'package:societyadminapp/Module/Generate%20Bill/View/generated_bill.dart';
import 'package:societyadminapp/Module/ImageHeroView/viewimage.dart';
import 'package:societyadminapp/Module/Login/View/login.dart';
import 'package:societyadminapp/Module/Measurements/View/add_measurements.dart';
import 'package:societyadminapp/Module/Measurements/View/measurements_view.dart';
import 'package:societyadminapp/Module/NoticeBoard/View/notice_board_screen.dart';
import 'package:societyadminapp/Module/Report%20Notifications/View/report_notifications_screen.dart';
import 'package:societyadminapp/Module/Splash/View/splash_screen.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/house_resident_verification.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/unverified_residents.dart';
import 'package:societyadminapp/Module/UpdateNoticeBoard/View/update_notice_screen.dart';
import 'package:societyadminapp/Module/UsersGuestHistory/View/particular_guest_arrival_screen.dart';
import 'package:societyadminapp/Module/UsersGuestHistory/View/users_guest_detail_screen.dart';
import 'package:societyadminapp/Module/UsersGuestHistory/View/users_guest_history_screen.dart';
import 'package:societyadminapp/Module/UsersReportHistory/View/users_report_history_screen.dart';
import 'package:societyadminapp/Module/UsersReportHistory/View/users_reports_history_list_screen.dart';
import 'package:societyadminapp/Module/View%20Residents/View/view_residents.dart';
import 'package:societyadminapp/Module/ViewReports/View/residents_report_list_screen.dart';
import 'package:societyadminapp/Module/ViewReports/View/reported_residents_screen.dart';
import 'package:societyadminapp/Routes/screen_binding.dart';
import 'package:societyadminapp/Routes/set_routes.dart';

import '../Module/AddSocietyDetail/Add Phases/View/add_phases.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingApartment/View/add_society_building_apartment.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingFloors/View/add_society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildings/View/add_society__buildings_screen.dart';
import '../Module/AddSocietyDetail/BlocksOrBuildings/View/blocks_or_buildings_screen.dart';
import '../Module/AddSocietyDetail/Houses/View/houses.dart';
import '../Module/AddSocietyDetail/Phases/View/phases.dart';
import '../Module/AddSocietyDetail/SocietyBuildingApartment/View/society_building_apartment_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildingFloor/View/society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildings/View/society_building_screen.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/UnVerifiedResidents/View/apartment_resident_verification.dart';
import '../Module/UpdateGateKeeper/View/updategatekeeper_detail_screen.dart';


class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashscreen,
          page: () => SplashScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: login,
          page: () => Login(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: homescreen,
          page: () => HomeScreen(),
          binding: ScreenBindings(),


      ),
      GetPage(
          name: viewuser,
          page: () =>ViewResidents(),
          binding: ScreenBindings(),
          ),


      // GetPage(
      //     name: chatscreen,
      //     page: () => ChatScreen(),
      //     binding: ScreenBindings(),
      //     ),
      GetPage(
          name: gatekeeperscreen,
          page: () => GateKeeperScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: addgatekeeperscreen,
          page: () => AddGateKeeper(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: updategatekeeperscreen,
          page: () => UpdateGateKepeerScreen(),
          binding: ScreenBindings(),
          ),

      GetPage(
          name: eventsscreen,
          page: () => EventsScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: addeventsscreen,
          page: () => AddEventsScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: updateevent,
          page: () => UpdateEvent(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: adminprofilescreen,
          page: () => AdminProfileScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: usersreportsscreen,
          page: () => UsersReportsScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: usersreportshistorylistscreen,
          page: () => UsersReportsHistoryListScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: usersguesthistoryscreen,
          page: () => UsersGuestHistorysScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: usersguestdetailscreen,
          page: () => UsersGuestDetailScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: particularguestarrivalscreen,
          page: () => ParticularGuestArrivalScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: reportnotificationsscreen,
          page: () => ReportNotificationsScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: viewreportscreen,
          page: () => ReportedResidentListScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: userreportslistscreen,
          page: () => UserReportsListScreen(),
          binding: ScreenBindings(),
          ),



      GetPage(
          name: noticeboardscreen,
          page: () => NoticeBoardScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
          name: addnoticeboardscreen,
          page: () => AddNoticeBoardScreen(),
          binding: ScreenBindings(),
          ),
      GetPage(
        name: updatenoticeboardscreen,
        page: () => UpdateNoticeBoardScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
          name: vieweventimages,
          page: () => ViewEventImages(),
          binding: ScreenBindings(),
          ),

      GetPage(
        name: viewheroimage,
        page: () => ViewImage(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addphases,
        page: () => AddPhases(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: phasess,
        page: () => Phases(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: blocks,
        page: () => Blocks(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addblocks,
        page: () => AddBlocks(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: streets,
        page: () => Street(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addstreets,
        page: () => AddStreets(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addhouses,
        page: () => AddHouses(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: houses,
        page: () => Houses(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: unverifiedresident,
        page: () => UnVerifiedResident(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: addmeasurements,
        page: () => AddMeasurements(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: measurementview,
        page: () => MeasurementView(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: houseresidentverification,
        page: () => HouseResidentVerification(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: apartmentresidentverification,
        page: () => ApartmentResidentVerification(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: generatebill,
        page: () => GenerateBill(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: generatedbill,
        page: () => GeneratedBill(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: blockorbuilding,
        page: () => BlockOrBuilding(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: societybuildingscreen,
        page: () => SocietyBuildingScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: addsocietybuildingscreen,
        page: () => AddSocietyBuildingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: societybuildingfloorsscreen,
        page: () => SocietyBuildingFloorsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addsocietybuildingfloors,
        page: () => AddSocietyBuildingFloors(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: societybuildingapartmentscreen,
        page: () => SocietyBuildingApartmentScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: addsocietybuildingapartmentsscreen,
        page: () => AddSocietyBuildingApartmentsScreen(),
        binding: ScreenBindings(),
      ),














    ];
  }
}
