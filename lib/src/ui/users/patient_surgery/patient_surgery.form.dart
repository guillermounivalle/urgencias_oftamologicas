import 'package:flutter/material.dart';
import 'package:urgencias_oftamologicas/src/blocs/common/view.model.consumer.dart';
import 'package:urgencias_oftamologicas/src/domain/patient_surgery/model/patientsurgery.enum.dart';
import 'package:urgencias_oftamologicas/src/repository/utils/dateutils.util.dart';
import 'package:urgencias_oftamologicas/src/ui/users/patient_surgery/patient_surgery.view.model.dart';
import '../../../repository/styles/color.styles.dart';

class PatientSurgeryForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientSurgeryForm({required this.formKey, Key? key}) : super(key: key);

  @override
  State<PatientSurgeryForm> createState() => _PatientSurgeryFormState();
}

class _PatientSurgeryFormState extends State<PatientSurgeryForm> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer<PatientSurgeryViewModel>(
        builder: (context, model, _) {
          return Column(
            children: [
              _textInput(
                  label: 'Documento de Identidad:',
                  value: model.entity.documentId,
                  onSaved: (value) => model.entity.documentId = value,
                  validator: (value) => value != null && value != '',
                  keyboard: TextInputType.number
              ),
              _calendarInput(
                label: 'Fecha de Consulta:',
                value: model.entity.consultationDate,
                onSaved: (value) => model.entity.consultationDate = value,
              ),
              _enumInput<PrevSurgeryDays>(
                  label: 'Días de estancia\nantes de cirugía:',
                  value: model.entity.prevSurgeryDays,
                  items: PrevSurgeryDays.values,
                  onSaved: (value) => model.entity.prevSurgeryDays = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Sutura de \nConjuntiva',
                  value: model.entity.conjuctivalSuture,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.conjuctivalSuture = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Sutura de  \nCornea',
                  value: model.entity.cornealSuture,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.cornealSuture = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Sutura de\nEsclera',
                  value: model.entity.scleraSuture,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.scleraSuture = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Sutura de \nparpado',
                  value: model.entity.eyelidSuture,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.eyelidSuture = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Intubación de \nVía Lagrimal',
                  value: model.entity.lacrimalIntubation,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.lacrimalIntubation = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Faco + LIO',
                  value: model.entity.facoWithLio,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.facoWithLio = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Faco sin LIO',
                  value: model.entity.facoWithoutLio,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.facoWithoutLio = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Drenaje de\nAbsceso',
                  value: model.entity.abscessDrainage,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.abscessDrainage = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Evisceración',
                  value: model.entity.eyeEvisceration,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.eyeEvisceration = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Recubrimiento\nConjuntival',
                  value: model.entity.conjutivalLining,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.conjutivalLining = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Vitrectomía',
                  value: model.entity.victrectomy,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.victrectomy = value
              ),
              _enumInput<SelectAnswer>(
                  label: 'Membrana \nAmniótica',
                  value: model.entity.amnioticMembrane,
                  items: SelectAnswer.values,
                  onSaved: (value) => model.entity.amnioticMembrane = value
              ),
              _enumInput<VisualAcuity>(
                  label: 'Agudeza visual\nen Primer POP',
                  value: model.entity.visualAcuityFirstPop,
                  items: VisualAcuity.values,
                  onSaved: (value) => model.entity.visualAcuityFirstPop = value
              ),
            ],
          );
        }
    );
  }

  Widget _textInput({required String label,
    required String? value,
    required Function(String? value) onSaved,
    bool Function(String? value)? validator,
    TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: TextFormField(
          scrollPhysics: null,
          maxLines: 5,
          initialValue: value,
          onSaved: (value) => onSaved.call(value),
          validator: (value) => validator != null && !validator.call(value) ? 'Campo Obligatorio' : null,
          decoration: InputDecoration(
            hintText: 'Escriba aquí',
            hintStyle: TextStyle(color: Colors.white70),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5)
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.white),
          ),
          keyboardType: keyboard,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Widget _textLabel({required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: TextField(
          enableInteractiveSelection: false,
          enabled: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorStyles.appbarprimarycolor,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5)
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 5,
                fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _calendarInput({required String label,
    DateTime? value,
    required Function(DateTime? value) onSaved,
    bool Function(String? value)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        readOnly: true,
        style: TextStyle(color: Colors.white),
        initialValue: value != null ? OFTDateUtils.format(value) : null,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.5)
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white,)
        ),
        validator: (value) => validator != null && !validator.call(value) ? 'Valor Obligatorio.' : null,
        key: UniqueKey(),
        onTap: () => showDatePicker(
            context: context,
            initialDate: value != null ? value : DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now()
        ).then((value) => setState((){
          onSaved.call(value);
          widget.formKey.currentState!.save();
        })),
      ),
    );
  }

  Widget _enumInput<T extends OFTJsonEnum>({required String label,
    required T? value, required List<T> items, required Function(T? value) onSaved}) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(width: 0.5, color: Colors.white)),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(color: Colors.white, fontSize: 18),),
                DropdownButton<T>(
                  value: value,
                  dropdownColor: ColorStyles.appbarprimarycolor,
                  hint: Text('Seleccione uno:', style: TextStyle(color: Colors.white70),),
                  items: items.map((e) =>
                      DropdownMenuItem(
                          value: e,
                          child: Text(e.getValue(),
                            style: TextStyle(color: Colors.white),)
                      )
                  ).toList(),
                  onChanged: (value) => setState(() => onSaved.call(value)),
                ),
              ],
            ),
          ),
        )
    );
  }

}
