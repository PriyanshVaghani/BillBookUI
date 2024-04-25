import 'package:bill_book_ui/model/industry_type_model.dart';
import 'package:bill_book_ui/model/subindustry_type_model.dart';

List<String> listOfLanguage = [
  "English",
  "Hinglish",
  "Hindi",
  "Gujarati",
  "Tamil",
];

List<String> listTypeOfBusiness = [
  "Retailer",
  "Wholesaler",
  "Distributor",
  "Manufacture",
  "Services",
];

List<IndustryType> listTypeOfIndustry = [
  IndustryType(
    type: "Popular Industries",
    subIndustryDetails: [
      SubIndustryType(
        id: 1,
        title: "Electronics",
        subtitle: "ACs, TVs, Laptops, Geysers, Washing machines",
      ),
      SubIndustryType(
        id: 2,
        title: "Consulting",
      ),
      SubIndustryType(
          id: 2,
          title: "Accounting",
          subtitle: "GST Finding, GST Return, Income txt filing"),
      SubIndustryType(
        id: 3,
        title: "Doctor / Clinic / Hospital",
      ),
    ],
  ),
  IndustryType(
    type: "All Industries",
    subIndustryDetails: [
      SubIndustryType(
        id: 4,
        title: "Battery",
        subtitle: "Inverter, UPS",
      ),
      SubIndustryType(
        id: 5,
        title: "Cleaning and Pest Control",
      ),
      SubIndustryType(
        id: 6,
        title: "Battery",
        subtitle: "Inverter, UPS",
      ),
    ],
  ),
];

List<String> listOfGST = [
  "None",
  "TAX Exempted",
  "GST @ 0%",
  "GST @ 0.1%",
  "GST @ 0.25%",
  "GST @ 1.5%",
  "GST @ 3%",
  "GST @ 5%",
  "GST @ 6%",
  "GST @ 12%",
  "GST @ 13.8%",
  "GST @ 14%",
];
