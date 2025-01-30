import 'package:chameleon/global/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/global_widget/list_text_field.dart';
import '../../../../../login/models/StockProductType.dart';
import '../../../../model/sales/getAllCustomers/Data.dart';
import '../../../../model/sales/getAllDiscountType/Data.dart';
import '../../../../model/sales/getAllProductUnit/Data.dart';
import '../../../../model/sales/getItemGroup/Data.dart';
import '../../../../model/sales/getRetailGroups/Data.dart';
import '../../../../model/sales/tax/Data.dart';

class GroupsListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  GroupsListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<DataProductGroups>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.groupNameWithCode ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class StockProductTypeField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  StockProductTypeField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<StockProductType>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: Get
              .find<LanguageController>()
              .isArabic
              ? item.nameA ?? ''
          : Get
              .find<LanguageController>()
              .isEn
              ? item.nameE ?? '':
          Get
              .find<LanguageController>()
              .isHindi
              ? item.nameH ??''
          : Get
              .find<LanguageController>()
              .isFr
              ? item.nameF ??'': item.nameU ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}


class GroupNameListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  GroupNameListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<DataProductGroups>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.groupNameWithCode ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class CustomersListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  CustomersListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<AllCustomersList>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.partnerNameWithCode ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class ProductUnitListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  ProductUnitListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<ProductUnitList>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.unitNameWithCode ?? '',
           subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class DiscountTypeListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;
  String hintText;

  DiscountTypeListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.hintText,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<DiscountTypeList>(
        hintText: hintText,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.discountTypeNameWithCode ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class SuppliersListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;

  final VoidCallback execute;

  SuppliersListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.execute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<RetailSuppliersList>(
        hintText: LocaleKeys.supplier.tr,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.partnerNameWithCode ?? '',
          subtitle: '',
        ),
        executeClose: execute,
      ),
    );
  }
}

class TaxListTextField extends StatelessWidget {
  final onSuggetionSelected, controller, suggetionCallBack;
  final VoidCallback executeClose;

  TaxListTextField({
    Key? key,
    this.controller,
    this.onSuggetionSelected,
    this.suggetionCallBack,
    required this.executeClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomGroupTextFieldinItemGroups<RetailTaxList>(
        hintText: LocaleKeys.taxName.tr,
        suggestionsCallback: suggetionCallBack,
        onSuggestionSelected: onSuggetionSelected,
        controller: controller,
        itemBuilder: (_, item) => SuggestionTile(
          title: item.taxName ?? '',
          subtitle: '',
        ),
        executeClose: executeClose,
      ),
    );
  }
}

class CustomGroupTextFieldinItemGroups<T> extends StatelessWidget {
  CustomGroupTextFieldinItemGroups(
      {Key? key,
      this.suggestionsBoxController,
      required this.suggestionsCallback,
      required this.onSuggestionSelected,
      required this.controller,
      required this.itemBuilder,
      required this.hintText,
      this.isClearButtonVisible = true,
      required this.executeClose})
      : super(key: key);
  final SuggestionsController<T>? suggestionsBoxController;
  final Future<List<T>?> Function(String) suggestionsCallback;
  final void Function(T)?  onSuggestionSelected;
  final TextEditingController controller;
  final VoidCallback executeClose;

  final Widget Function(BuildContext, T) itemBuilder;
  final String hintText;

  final bool isClearButtonVisible;

  // final VoidCallback on

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TypeAheadField<T>(
          suggestionsController: suggestionsBoxController,
          suggestionsCallback: suggestionsCallback,
          loadingBuilder: (context) {
            return const SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
          itemBuilder: itemBuilder,
          emptyBuilder: (context) {
            return const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'لم نجد نتيجه',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
          onSelected: onSuggestionSelected,
          controller: controller,
          // textFieldConfiguration: TextFieldConfiguration(
          //   onTap: () {},
          //
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     disabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     errorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     focusedErrorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(12),
          //         borderSide: BorderSide(color: Colors.black12)),
          //     filled: true,
          //     fillColor: Colors.grey.shade100,
          //     hintText: hintText,
          //     hintStyle: const TextStyle(
          //       fontSize: 12.0,
          //     ),
          //     contentPadding: const EdgeInsets.fromLTRB(
          //       5,
          //       0,
          //       5,
          //       0,
          //     ),
          //   ),
          // ),
        ),
        if (isClearButtonVisible)
          Positioned.fill(
            left: 5,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SizedBox(
                height: 25,
                width: 25,
                child: FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  onPressed: () {
                    controller.clear();
                    executeClose();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 17,
                  ),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
