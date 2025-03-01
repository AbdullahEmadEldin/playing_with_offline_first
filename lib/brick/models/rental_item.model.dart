// import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
// import 'package:brick_supabase/brick_supabase.dart';
// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'rental_item.freezed.dart';
// part 'rental_item.g.dart';

// /// Represents a car model with its details and pricing information.
// ///
// /// This is the main model class that contains all information about a car listing,
// /// including its basic details, specifications, pricing options and availability.
// @freezed
// @ConnectOfflineFirstWithSupabase(
//   supabaseConfig: SupabaseSerializable(tableName: 'notes'),
// )
// class RentalItem with _$RentalItem {
//   const factory RentalItem({
//     /// Unique identifier for the car
//     @Default(0) int id,

//     /// Name of the car model (e.g. "Range Rover Sport")
//     @Default('') String name,

//     /// Timestamp when this car was added to the system
//     @JsonKey(name: 'created_at') required DateTime createdAt,

//     /// List of URLs to car images showing different views of the vehicle
//     @JsonKey(name: 'image_urls') @Default([]) List<String> imageUrls,

//     /// Minimum number of days required to book the car
//     @JsonKey(name: 'min_days_booking') int? minDaysBooking,

//     /// Maximum number of days the car can be booked for
//     @JsonKey(name: 'max_days_booking') int? maxDaysBooking,
//     @JsonKey(name: 'instant_booking') bool? instantBooking,
//     /// Requirements for renting the car
//     String? requirements,

//     /// Description of the car
//     String? description,

//     /// Detailed technical and feature information about the car
//     required Car car,

//     /// List of rental pricing options for different durations
//     @Default([]) List<RentalPricing> pricings,

//     /// Provider information
//     CarProvider? provider,

//     /// Kilometer limits for different rental durations
//     @JsonKey(name: 'km_limit') @Default([]) List<KmLimit> kmLimit,

//     /// List of features available with this car
//     /// List of features available with this car (e.g. "Cruise Control", "Leather Seats", "Sunroof")
//     @JsonKey(name: 'features') @Default([]) List<CarFeature>? features,

//     /// List of available locations for pickup/dropoff
//     @Default([]) List<RentalLocation> locations,

//     /// Delivery fees for different cities
//     @JsonKey(name: 'delivery_fees') @Default([]) List<DeliveryFee> deliveryFees,

//     /// Rental conditions and terms
//     @Default([]) List<RentalCondition> conditions,

//     /// Additional services that can be added
//     @JsonKey(name: 'extra_services')
//     @Default([])
//     List<ExtraService> extraServices,

//     /// flag to track if we have full details
//     @Default(false) bool hasFullDetails,
//   }) = _RentalItem;

//   /// Creates a RentalItem instance from JSON data
//   factory RentalItem.fromJson(Map<String, dynamic> json) =>
//       _$RentalItemFromJson(json);
// }

// /// Contains detailed information about a specific car.
// ///
// /// This class holds all the technical details, features, and rental-specific
// /// information about a car, including its specifications, brand, category,
// /// availability and pricing options.
// @freezed
// class Car with _$Car {
//   const factory Car({
//     /// Whether insurance coverage is included in the rental
//     @Default(false) bool insurance,

//     /// Whether delivery to customer's location is free
//     @JsonKey(name: 'free_delivery') @Default(false) bool freeDelivery,

//     /// Whether the car can be rented for just one day
//     @JsonKey(name: 'one_day_renal') @Default(false) bool oneDayRental,

//     /// Information about the car's manufacturer
//     CarBrand? brand,

//     /// License plate number
//     @JsonKey(name: 'license_of_the_car') String? licenseOfTheCar,

//     /// Whether unlimited kilometers are included
//     @JsonKey(name: 'unlimited_km') bool? unlimitedKm,

//     /// Whether deposit is waived
//     @JsonKey(name: 'free_deposit') bool? freeDeposit,

//     /// Required deposit amount
//     double? deposit,

//     /// Price to waive deposit requirement
//     @JsonKey(name: 'deposit_free_price') double? depositFreePrice,

//     /// Car category information
//     CarCategory? category,

//     /// Detailed specifications
//     List<CarSpecifications>? specifications,

//     /// Availability calendar
//     @Default([]) List<CarAvailability> availabilities,

//     /// Extra kilometer pricing tiers
//     @JsonKey(name: 'extra_km_pricing')
//     @Default([])
//     List<ExtraKmPricing> extraKmPricing,
//   }) = _Car;

//   /// Creates a Car instance from JSON data
//   factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
// }

// /// Represents a car manufacturer brand.
// ///
// /// Contains basic information about a car manufacturer, including their
// /// name and brand icon.
// @freezed
// class CarBrand with _$CarBrand {
//   const factory CarBrand({
//     /// Unique identifier for the brand
//     @Default(0) int id,

//     /// Name of the car manufacturer
//     @Default('') String name,

//     /// URL to the manufacturer's logo/icon
//     @Default('') String icon,
//   }) = _CarBrand;

//   /// Creates a CarBrand instance from JSON data
//   factory CarBrand.fromJson(Map<String, dynamic> json) =>
//       _$CarBrandFromJson(json);
// }

// /// Represents pricing for different rental durations.
// ///
// /// Defines both regular and discounted prices for various rental periods
// /// like daily, weekly, or monthly rentals.
// @freezed
// class RentalPricing with _$RentalPricing {
//   const factory RentalPricing({
//     /// Type of rental duration (daily, weekly, monthly)
//     @JsonKey(name: 'duration_type') @Default('') String durationType,

//     /// Standard rental price for this duration
//     @JsonKey(name: 'regular_price') @Default(0.0) double regularPrice,

//     /// Discounted price if available
//     @JsonKey(name: 'discounted_price') double? discountedPrice,
//   }) = _RentalPricing;

//   /// Creates a RentalPricing instance from JSON data
//   factory RentalPricing.fromJson(Map<String, dynamic> json) =>
//       _$RentalPricingFromJson(json);
// }

// // Additional model classes that are currently optional
// @freezed
// class CarProvider with _$CarProvider {
//   const factory CarProvider({
//     @JsonKey(name: 'full_name') String? fullName,
//     @JsonKey(name: 'profile_pic_url') String? profilePicUrl,
//     @JsonKey(name: 'details') ProviderDetails? details,
//   }) = _CarProvider;

//   factory CarProvider.fromJson(Map<String, dynamic> json) =>
//       _$CarProviderFromJson(json);
// }

// @freezed
// class ReviewCount with _$ReviewCount {
//   const factory ReviewCount({
//     @Default(0) @JsonKey(name: 'count') int count,
//   }) = _ReviewCount;

//   factory ReviewCount.fromJson(Map<String, dynamic> json) =>
//       _$ReviewCountFromJson(json);
// }

// @freezed
// class ProviderReview with _$ProviderReview {
//   const factory ProviderReview({
//     String? username,
//     String? userphoto,
//     double? rating,
//     String? review,
//     @JsonKey(name: 'created_at') DateTime? createdAt,
//   }) = _ProviderReview;

//   factory ProviderReview.fromJson(Map<String, dynamic> json) =>
//       _$ProviderReviewFromJson(json);
// }

// @freezed
// class ProviderDetails with _$ProviderDetails {
//   const factory ProviderDetails({
//     @JsonKey(name: 'renting_rate') double? rentingRate,
//     @JsonKey(name: 'years_of_renting') int? yearsOfRenting,
//     @JsonKey(name: 'reviews') List<ProviderReview>? reviews,
//     @JsonKey(name: 'reviews_count') List<ReviewCount>? reviewsCount,
//   }) = _ProviderDetails;

//   factory ProviderDetails.fromJson(Map<String, dynamic> json) =>
//       _$ProviderDetailsFromJson(json);
// }

// @freezed
// class KmLimit with _$KmLimit {
//   const factory KmLimit({
//     @JsonKey(name: 'duration_type') String? durationType,
//     @JsonKey(name: 'km_limit') int? kmLimit,
//   }) = _KmLimit;

//   factory KmLimit.fromJson(Map<String, dynamic> json) =>
//       _$KmLimitFromJson(json);
// }

// @freezed
// class CarFeature with _$CarFeature {
//   const factory CarFeature({
//     String? name,
//     Map<String, String>? translations,
//   }) = _CarFeature;

//   factory CarFeature.fromJson(Map<String, dynamic> json) =>
//       _$CarFeatureFromJson(json['feature']);
// }

// @freezed
// class RentalLocation with _$RentalLocation {
//   const factory RentalLocation({
//     City? city,
//   }) = _RentalLocation;

//   factory RentalLocation.fromJson(Map<String, dynamic> json) =>
//       _$RentalLocationFromJson(json);
// }

// @freezed
// class City with _$City {
//   const factory City({
//     String? name,
//     int? id,
//   }) = _City;

//   factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
// }

// @freezed
// class DeliveryFee with _$DeliveryFee {
//   const factory DeliveryFee({
//     City? city,
//     @JsonKey(name: 'is_free_delivery') bool? isFreeDelivery,
//     @JsonKey(name: 'pickup_fee') double? pickupFee,
//     @JsonKey(name: 'dropoff_fee') double? dropoffFee,
//   }) = _DeliveryFee;

//   factory DeliveryFee.fromJson(Map<String, dynamic> json) =>
//       _$DeliveryFeeFromJson(json);
// }

// @freezed
// class RentalCondition with _$RentalCondition {
//   const factory RentalCondition({
//     @JsonKey(name: 'condition_title') String? conditionTitle,
//     @JsonKey(name: 'condition_text') String? conditionText,
//   }) = _RentalCondition;

//   factory RentalCondition.fromJson(Map<String, dynamic> json) =>
//       _$RentalConditionFromJson(json);
// }

// @freezed
// class DiscountCode with _$DiscountCode {
//   const factory DiscountCode({
//     String? code,
//     @JsonKey(name: 'discount_value') double? discountValue,
//   }) = _DiscountCode;

//   factory DiscountCode.fromJson(Map<String, dynamic> json) =>
//       _$DiscountCodeFromJson(json);
// }

// @freezed
// class ExtraService with _$ExtraService {
//   const factory ExtraService(
//       {int? id, String? name, double? price, int? count}) = _ExtraService;

//   factory ExtraService.fromJson(Map<String, dynamic> json) =>
//       _$ExtraServiceFromJson(json);
// }

// @freezed
// class CarCategory with _$CarCategory {
//   const factory CarCategory({
//     @Default(0) int id,
//     @Default('') String name,
//     Map<String, String>? translations,
//   }) = _CarCategory;

//   factory CarCategory.fromJson(Map<String, dynamic> json) =>
//       _$CarCategoryFromJson(json);
// }

// @freezed
// class CarSpecifications with _$CarSpecifications {
//   const factory CarSpecifications({
//     @JsonKey(name: 'fuel_type') String? fuelType,
//     int? seats,
//     int? doors,
//     int? year,
//     String? engine,
//     int? horsepower,
//     double? acceleration,
//     @JsonKey(name: 'top_speed') int? topSpeed,
//     String? color,
//     String? luggage,
//     String? cylinder,
//   }) = _CarSpecifications;

//   factory CarSpecifications.fromJson(Map<String, dynamic> json) =>
//       _$CarSpecificationsFromJson(json);
// }

// @freezed
// class CarAvailability with _$CarAvailability {
//   const factory CarAvailability({
//     @JsonKey(name: 'date') DateTime? date,
//     @JsonKey(name: 'stocks_taken') int? stocksTaken,
//     @JsonKey(name: 'total_stock') int? totalStock,
//   }) = _CarAvailability;

//   factory CarAvailability.fromJson(Map<String, dynamic> json) =>
//       _$CarAvailabilityFromJson(json);
// }

// @freezed
// class ExtraKmPricing with _$ExtraKmPricing {
//   const factory ExtraKmPricing({
//     @JsonKey(name: 'kilometers') int? kmLimit,
//     @JsonKey(name: 'price') num? price,
//   }) = _ExtraKmPricing;

//   factory ExtraKmPricing.fromJson(Map<String, dynamic> json) =>
//       _$ExtraKmPricingFromJson(json);
// }
