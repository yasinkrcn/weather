// import '../_core_exports.dart';

// class AppProfileImage extends StatelessWidget {
//   final String imageUrl;

//   final double? size;
//   final double? height;
//   final double? width;

//   final void Function()? onTap;
//   late final ProfileImageType _profileImageType;

//   AppProfileImage._({
//     Key? key,
//     required this.imageUrl,
//     this.size,
//     this.height,
//     this.width,
//     this.onTap,
//     required ProfileImageType profileImageType,
//   }) : super(key: key) {
//     _profileImageType = profileImageType;
//   }

//   factory AppProfileImage.circle({
//     required String imageUrl,
//     double? size,
//     void Function()? onTap,
//   }) {
//     return AppProfileImage._(
//       onTap: onTap,
//       imageUrl: imageUrl,
//       size: size,
//       profileImageType: ProfileImageType.circle,
//     );
//   }
//   factory AppProfileImage.custom({
//     required String imageUrl,
//     double? height,
//     double? width,
//     void Function()? onTap,
//   }) {
//     return AppProfileImage._(
//       onTap: onTap,
//       imageUrl: imageUrl,
//       height: height,
//       width: width,
//       profileImageType: ProfileImageType.custom,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (_profileImageType) {
//       case ProfileImageType.circle:
//         return GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: size ?? 75,
//             width: size ?? 75,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColors.primaryColor,
//                 width: 2,
//               ),
//             ),
//             child: ClipOval(
//               child: CachedNetworkImage(
//                 fit: BoxFit.cover,
//                 imageUrl: imageUrl,
//                 placeholder: (context, url) {
//                   return const AppLoadingWidget();
//                 },
//                 errorWidget: (context, url, error) {
//                   return const AppErrorWidget();
//                 },
//               ),
//             ),
//           ),
//         );
//       case ProfileImageType.custom:
//         return GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: height ?? 50,
//             width: width ?? 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColors.primaryColor,
//                 width: 2,
//               ),
//             ),
//             child: ClipOval(
//               child: CachedNetworkImage(
//                 fit: BoxFit.cover,
//                 imageUrl: imageUrl,
//                 placeholder: (context, url) {
//                   return const AppLoadingWidget();
//                 },
//                 errorWidget: (context, url, error) {
//                   return const AppErrorWidget();
//                 },
//               ),
//             ),
//           ),
//         );
//     }
//   }
// }

// enum ProfileImageType {
//   circle,
//   custom,
// }
