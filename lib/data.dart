import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class caseData {
  static String casedata =
      '{"cases_time_series":[{"dailyconfirmed":"1","dailydeceased":"0","dailyrecovered":"0","date":"30 January ","totalconfirmed":"1","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"31 January ","totalconfirmed":"1","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"01 February ","totalconfirmed":"1","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"1","dailydeceased":"0","dailyrecovered":"0","date":"02 February ","totalconfirmed":"2","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"1","dailydeceased":"0","dailyrecovered":"0","date":"03 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"04 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"05 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"06 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"07 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"08 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"09 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"10 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"11 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"12 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"0"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"1","date":"13 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"1"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"14 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"1"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"15 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"1"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"1","date":"16 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"2"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"17 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"2"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"18 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"2"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"19 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"2"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"1","date":"20 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"21 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"22 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"23 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"24 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"25 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"26 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"27 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"28 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"29 February ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"0","dailydeceased":"0","dailyrecovered":"0","date":"01 March ","totalconfirmed":"3","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"2","dailydeceased":"0","dailyrecovered":"0","date":"02 March ","totalconfirmed":"5","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"1","dailydeceased":"0","dailyrecovered":"0","date":"03 March ","totalconfirmed":"6","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"22","dailydeceased":"0","dailyrecovered":"0","date":"04 March ","totalconfirmed":"28","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"2","dailydeceased":"0","dailyrecovered":"0","date":"05 March ","totalconfirmed":"30","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"1","dailydeceased":"0","dailyrecovered":"0","date":"06 March ","totalconfirmed":"31","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"3","dailydeceased":"0","dailyrecovered":"0","date":"07 March ","totalconfirmed":"34","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"5","dailydeceased":"0","dailyrecovered":"0","date":"08 March ","totalconfirmed":"39","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"9","dailydeceased":"0","dailyrecovered":"0","date":"09 March ","totalconfirmed":"48","totaldeceased":"0","totalrecovered":"3"},{"dailyconfirmed":"15","dailydeceased":"0","dailyrecovered":"1","date":"10 March ","totalconfirmed":"63","totaldeceased":"0","totalrecovered":"4"},{"dailyconfirmed":"7","dailydeceased":"0","dailyrecovered":"0","date":"11 March ","totalconfirmed":"70","totaldeceased":"0","totalrecovered":"4"},{"dailyconfirmed":"12","dailydeceased":"1","dailyrecovered":"0","date":"12 March ","totalconfirmed":"82","totaldeceased":"1","totalrecovered":"4"},{"dailyconfirmed":"9","dailydeceased":"0","dailyrecovered":"6","date":"13 March ","totalconfirmed":"91","totaldeceased":"1","totalrecovered":"10"},{"dailyconfirmed":"16","dailydeceased":"1","dailyrecovered":"0","date":"14 March ","totalconfirmed":"107","totaldeceased":"2","totalrecovered":"10"},{"dailyconfirmed":"6","dailydeceased":"0","dailyrecovered":"3","date":"15 March ","totalconfirmed":"113","totaldeceased":"2","totalrecovered":"13"},{"dailyconfirmed":"14","dailydeceased":"0","dailyrecovered":"1","date":"16 March ","totalconfirmed":"127","totaldeceased":"2","totalrecovered":"14"},{"dailyconfirmed":"19","dailydeceased":"1","dailyrecovered":"1","date":"17 March ","totalconfirmed":"146","totaldeceased":"3","totalrecovered":"15"},{"dailyconfirmed":"25","dailydeceased":"0","dailyrecovered":"0","date":"18 March ","totalconfirmed":"171","totaldeceased":"3","totalrecovered":"15"},{"dailyconfirmed":"28","dailydeceased":"1","dailyrecovered":"5","date":"19 March ","totalconfirmed":"199","totaldeceased":"4","totalrecovered":"20"},{"dailyconfirmed":"59","dailydeceased":"0","dailyrecovered":"3","date":"20 March ","totalconfirmed":"258","totaldeceased":"4","totalrecovered":"23"},{"dailyconfirmed":"76","dailydeceased":"0","dailyrecovered":"0","date":"21 March ","totalconfirmed":"334","totaldeceased":"4","totalrecovered":"23"},{"dailyconfirmed":"69","dailydeceased":"3","dailyrecovered":"0","date":"22 March ","totalconfirmed":"403","totaldeceased":"7","totalrecovered":"23"},{"dailyconfirmed":"102","dailydeceased":"2","dailyrecovered":"2","date":"23 March ","totalconfirmed":"505","totaldeceased":"9","totalrecovered":"25"},{"dailyconfirmed":"66","dailydeceased":"1","dailyrecovered":"15","date":"24 March ","totalconfirmed":"571","totaldeceased":"10","totalrecovered":"40"},{"dailyconfirmed":"86","dailydeceased":"1","dailyrecovered":"3","date":"25 March ","totalconfirmed":"657","totaldeceased":"11","totalrecovered":"43"},{"dailyconfirmed":"78","dailydeceased":"5","dailyrecovered":"7","date":"26 March ","totalconfirmed":"735","totaldeceased":"16","totalrecovered":"50"},{"dailyconfirmed":"151","dailydeceased":"3","dailyrecovered":"25","date":"27 March ","totalconfirmed":"886","totaldeceased":"19","totalrecovered":"75"},{"dailyconfirmed":"143","dailydeceased":"5","dailyrecovered":"10","date":"28 March ","totalconfirmed":"1029","totaldeceased":"24","totalrecovered":"85"}],"key_values":[{"confirmeddelta":"109","counterforautotimeupdate":"645","deceaseddelta":"3","lastupdatedtime":"29\/03\/2020 23:42:24","recovereddelta":"5","statesdelta":"0"}],"statewise":[{"active":"1021","confirmed":"1138","deaths":"27","delta":{"active":109,"confirmed":109,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 23:42:24","recovered":"90","state":"Total"},{"active":"185","confirmed":"202","deaths":"1","delta":{"active":20,"confirmed":20,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 18:17:24","recovered":"16","state":"Kerala"},{"active":"171","confirmed":"203","deaths":"7","delta":{"active":17,"confirmed":17,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 19:17:24","recovered":"25","state":"Maharashtra"},{"active":"75","confirmed":"83","deaths":"3","delta":{"active":2,"confirmed":2,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 18:52:24","recovered":"5","state":"Karnataka"},{"active":"68","confirmed":"70","deaths":"1","delta":{"active":3,"confirmed":3,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 23:12:24","recovered":"1","state":"Telangana"},{"active":"61","confirmed":"72","deaths":"0","delta":{"active":7,"confirmed":7,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 23:02:24","recovered":"11","state":"Uttar Pradesh"},{"active":"56","confirmed":"59","deaths":"0","delta":{"active":5,"confirmed":5,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 14:22:24","recovered":"3","state":"Rajasthan"},{"active":"57","confirmed":"63","deaths":"5","delta":{"active":8,"confirmed":8,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 19:52:24","recovered":"1","state":"Gujarat"},{"active":"64","confirmed":"72","deaths":"2","delta":{"active":23,"confirmed":23,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 20:22:25","recovered":"6","state":"Delhi"},{"active":"36","confirmed":"38","deaths":"1","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 01:27:24","recovered":"1","state":"Punjab"},{"active":"47","confirmed":"50","deaths":"1","delta":{"active":8,"confirmed":8,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 18:17:24","recovered":"2","state":"Tamil Nadu"},{"active":"24","confirmed":"35","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 01:27:24","recovered":"11","state":"Haryana"},{"active":"37","confirmed":"39","deaths":"2","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 04:02:25","recovered":"0","state":"Madhya Pradesh"},{"active":"36","confirmed":"38","deaths":"1","delta":{"active":5,"confirmed":5,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 12:17:24","recovered":"1","state":"Jammu and Kashmir"},{"active":"10","confirmed":"13","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"27\/03\/2020 11:52:25","recovered":"3","state":"Ladakh"},{"active":"20","confirmed":"21","deaths":"0","delta":{"active":2,"confirmed":2,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 23:42:25","recovered":"1","state":"Andhra Pradesh"},{"active":"19","confirmed":"20","deaths":"1","delta":{"active":2,"confirmed":2,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 20:12:25","recovered":"0","state":"West Bengal"},{"active":"14","confirmed":"15","deaths":"1","delta":{"active":4,"confirmed":4,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 19:37:25","recovered":"0","state":"Bihar"},{"active":"8","confirmed":"8","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Chandigarh"},{"active":"7","confirmed":"7","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"27\/03\/2020 21:17:25","recovered":"0","state":"Chhattisgarh"},{"active":"6","confirmed":"7","deaths":"0","delta":{"active":1,"confirmed":1,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 19:17:25","recovered":"1","state":"Uttarakhand"},{"active":"0","confirmed":"3","deaths":"1","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"28\/03\/2020 23:12:25","recovered":"2","state":"Himachal Pradesh"},{"active":"5","confirmed":"5","deaths":"0","delta":{"active":2,"confirmed":2,"deaths":0,"recovered":0},"lastupdatedtime":"29\/03\/2020 18:52:25","recovered":"0","state":"Goa"},{"active":"3","confirmed":"3","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Odisha"},{"active":"9","confirmed":"9","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"28\/03\/2020 19:42:27","recovered":"0","state":"Andaman and Nicobar Islands"},{"active":"1","confirmed":"1","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Puducherry"},{"active":"1","confirmed":"1","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Manipur"},{"active":"1","confirmed":"1","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Mizoram"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Assam"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Meghalaya"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Tripura"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Arunachal Pradesh"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Jharkhand"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Nagaland"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Sikkim"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Dadra and Nagar Haveli"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Daman and Diu"},{"active":"0","confirmed":"0","deaths":"0","delta":{"active":0,"confirmed":0,"deaths":0,"recovered":0},"lastupdatedtime":"26\/03\/2020 07:19:29","recovered":"0","state":"Lakshadweep"}],"tested":[{"source":"Press_Release_ICMR_13March2020.pdf","totalindividualstested":"5900","totalpositivecases":"78","totalsamplestested":"6500","updatetimestamp":"13\/3\/2020 00:00"},{"source":"ICMR_website_update_18March_6PM_IST.pdf","totalindividualstested":"12235","totalpositivecases":"150","totalsamplestested":"13125","updatetimestamp":"18\/3\/2020 18:00"},{"source":"ICMR_website_update_19March_10AM_IST_V2.pdf","totalindividualstested":"12426","totalpositivecases":"168","totalsamplestested":"13316","updatetimestamp":"19\/3\/2020 10:00"},{"source":"ICMR_website_update_19March_6PM_IST.pdf","totalindividualstested":"13285","totalpositivecases":"182","totalsamplestested":"14175","updatetimestamp":"19\/3\/2020 18:00"},{"source":"ICMR_website_update_20March_10AM_IST.pdf","totalindividualstested":"13486","totalpositivecases":"206","totalsamplestested":"14376","updatetimestamp":"20\/3\/2020 10:00"},{"source":"ICMR_website_update_20March_6PM_IST.pdf","totalindividualstested":"14514","totalpositivecases":"236","totalsamplestested":"15404","updatetimestamp":"20\/3\/2020 18:00"},{"source":"ICMR_website_update_21March_10AM_IST.pdf","totalindividualstested":"14811","totalpositivecases":"271","totalsamplestested":"15701","updatetimestamp":"21\/3\/2020 10:00"},{"source":"ICMR_website_update_21March_6PM_IST.pdf","totalindividualstested":"16021","totalpositivecases":"315","totalsamplestested":"16911","updatetimestamp":"21\/3\/2020 18:00"},{"source":"ICMR_website_update_22March_10AM_IST.pdf","totalindividualstested":"16109","totalpositivecases":"341","totalsamplestested":"16999","updatetimestamp":"22\/3\/2020 10:00"},{"source":"ICMR_website_update_22March_6PM_IST.pdf","totalindividualstested":"17237","totalpositivecases":"396","totalsamplestested":"18127","updatetimestamp":"22\/3\/2020 18:00"},{"source":"ICMR_website_update_23March_10AM_IST.pdf","totalindividualstested":"17493","totalpositivecases":"415","totalsamplestested":"18383","updatetimestamp":"23\/3\/2020 10:00"},{"source":"ICMR_website_update_23March_8PM_IST.pdf","totalindividualstested":"19817","totalpositivecases":"471","totalsamplestested":"20707","updatetimestamp":"23\/3\/2020 20:00"},{"source":"ICMR_website_update_24March_10AM_IST.pdf","totalindividualstested":"19974","totalpositivecases":"482","totalsamplestested":"20864","updatetimestamp":"24\/3\/2020 10:00"},{"source":"ICMR_website_update_24March_8PM_IST.pdf","totalindividualstested":"21804","totalpositivecases":"536","totalsamplestested":"22694","updatetimestamp":"24\/3\/2020 20:00"},{"source":"ICMR_website_update_25March_10AM_IST.pdf","totalindividualstested":"22038","totalpositivecases":"539","totalsamplestested":"22928","updatetimestamp":"25\/3\/2020 10:00"},{"source":"ICMR_website_update_25March_8PM_IST.pdf","totalindividualstested":"24254","totalpositivecases":"581","totalsamplestested":"25144","updatetimestamp":"25\/3\/2020 20:00"},{"source":"","totalindividualstested":"","totalpositivecases":"","totalsamplestested":"","updatetimestamp":"26\/3\/2020 10:00"},{"source":"","totalindividualstested":"","totalpositivecases":"","totalsamplestested":"","updatetimestamp":"26\/3\/2020 18:00"},{"source":"ICMR_website_update_27March_9AM_IST.pdf","totalindividualstested":"26798","totalpositivecases":"691","totalsamplestested":"27688","updatetimestamp":"27\/3\/2020 09:00"},{"source":"","totalindividualstested":"","totalpositivecases":"","totalsamplestested":"","updatetimestamp":"28\/3\/2020 09:00"}]}';
  static Map<String, dynamic> jData = jsonDecode(casedata);
  static List<dynamic> x = jData["cases_time_series"];

  static void fetchData(callback) async {
    var response =
        await http.get("https://yashmaurya.in/covid19_tracker/covid_data.php");
    casedata = response.body;
    jData = jsonDecode(casedata);
    x = jData["cases_time_series"];
    callback();
  }

  static Map<String, int> overAllData(callback) {
    Map<String, int> values = Map();

    values["todayConf"] =
        int.parse(jData["statewise"][0]["deltaconfirmed"].toString());
    values["todayRecov"] =
        int.parse(jData["statewise"][0]["deltarecovered"].toString());
    values["todayDeath"] =
        int.parse(jData["statewise"][0]["deltadeaths"].toString());
    values["todayActive"] = int.parse("0");

    values["totalConf"] =
        int.parse(jData["statewise"][0]["confirmed"].toString());
    values["totalActive"] =
        int.parse(jData["statewise"][0]["active"].toString());
    values["totalRecov"] =
        int.parse(jData["statewise"][0]["recovered"].toString());
    values["totalDeath"] =
        int.parse(jData["statewise"][0]["deaths"].toString());
    callback();
    return values;
  }

  static List<double> getData() {
    double start = 0;
    Map<String, dynamic> jData = json.decode(casedata);
    List<dynamic> x = jData["cases_time_series"];
    List<double> val = x.map((f) {
      if (f["dailyconfirmed"].toString().length > 0)
        start += double.parse(f["dailyconfirmed"]);
      return start;
    }).toList();
    return val;
  }

  static Map<DateTime, int> getDailyConf() {
    Map<DateTime, int> obj = new Map();

    x.forEach((f) {
      int start = 0;
      if (f["dailyconfirmed"].toString().length > 0) {
        start = int.parse(f["dailyconfirmed"]);
        DateTime dObj = DateFormat("d MMMM  yyyy").parse(f["date"] + " 2020");
        obj[dObj] = start;
      }
    });
    return obj;
  }

  static Map<DateTime, int> getDailyRecov() {
    Map<DateTime, int> obj = new Map();

    x.forEach((f) {
      int start = 0;
      if (f["dailyrecovered"].toString().length > 0) {
        start = int.parse(f["dailyrecovered"]);
        DateTime dObj = DateFormat("d MMMM  yyyy").parse(f["date"] + " 2020");
        obj[dObj] = start;
      }
    });
    return obj;
  }

  static Map<DateTime, int> getDailyDeaths() {
    Map<DateTime, int> obj = new Map();

    x.forEach((f) {
      int start = 0;
      if (f["dailydeceased"].toString().length > 0) {
        start = int.parse(f["dailydeceased"]);
        DateTime dObj = DateFormat("d MMMM  yyyy").parse(f["date"] + " 2020");
        obj[dObj] = start;
      }
    });
    return obj;
  }

  static String lastUpdateTime() {
    var date = DateFormat("dd/MM/yyyy HH:mm:ss")
        .parse(jData["statewise"][0]["lastupdatedtime"]);
    var diff = DateTime.now().difference(date);

    if (diff.inHours < 1) {
      return "Last updated " + diff.inMinutes.toString() + " min ago";
    } else {
      return "Last updated " + diff.inHours.toString() + " hr ago";
    }
  }

  static List<dynamic> stateWise() {
    List<dynamic> a = jData["statewise"];
    List<dynamic> values = List<dynamic>();
    a.forEach((i) {
      Map<String, String> temp = Map();
      if (i["state"].toString() != "Total") {
        temp["state"] = i["state"];
        temp["conf"] = i["confirmed"];
        temp["active"] = i["active"];
        temp["death"] = i["deaths"];
        temp["recov"] = i["recovered"];
        temp["todayConf"] = i["deltaconfirmed"].toString();
        values.add(temp);
      }
    });
    values.sort((a, b) => onSort(a, b, true, "conf"));
    return values;
  }

  static int onSort(a, b, acc, str) {
    if (acc) {
      return int.parse(a[str.toString()].toString()) <
              int.parse(b["conf"].toString())
          ? 1
          : -1;
    } else {
      return int.parse(b[str.toString()].toString()) <
              int.parse(a["conf"].toString())
          ? 1
          : -1;
    }
  }
}
