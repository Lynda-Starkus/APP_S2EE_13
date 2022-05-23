import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/OffresBloc/Offres_bloc.dart';

class LabeledKeySpan extends StatelessWidget {
  final Color color;
  final String label;
  final IconData prefixIcon;
  final Color labelColor;
  final String? tag;

  const LabeledKeySpan({
    required this.label,
    required this.color,
    required this.prefixIcon,
    required this.labelColor,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () => onSpanPressed(context),
        child: Chip(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          backgroundColor: color,
          avatar: Icon(prefixIcon, color: labelColor, size: 20.0),
          label: Text(
            label,
            style:
                Theme.of(context).textTheme.bodyText2!.apply(color: labelColor),
          ),
        ),
      ),
    );
  }

  void onSpanPressed(BuildContext context) {
    final entBloc = BlocProvider.of<EntreprisesBloc>(context);
    final offreBloc = BlocProvider.of<OffresBloc>(context);
    switch (label) {
      case 'Development':
        offreBloc.add(AskDevelopment());
        break;
      case 'Graphic Design':
        offreBloc.add(AskDesign());
        break;
      case 'Data Analysis':
        offreBloc.add(AskData());
        break;
      case 'UI/UX':
        offreBloc.add(AskUX());
        break;
      case "Stage ouvrier":
        switch (tag) {
          case "entreprise":
            entBloc.add(AskOuvrier());
            break;
          case "offre":
            offreBloc.add(AskOuvrierOffre());
            break;

          default:
            return null;
        }
        break;
      case "Emploi":
        switch (tag) {
          case "entreprise":
            entBloc.add(AskEmploi());
            break;
          case "offre":
            offreBloc.add(AskEmploiOffre());
            break;
          default:
            return null;
        }
        break;
      case "PFE":
        switch (tag) {
          case "entreprise":
            entBloc.add(AskPfe());
            break;
          case "offre":
            offreBloc.add(AskPfeOffre());
            break;
          default:
            return null;
        }
        break;
      case "Stage pratique":
        switch (tag) {
          case "entreprise":
            entBloc.add(AskPratique());
            break;
          case "offre":
            offreBloc.add(AskPratiqueOffre());
            break;
          default:
            return null;
        }
        break;
      default:
        return null;
    }
  }
}
