nf = $.pivotUtilities.numberFormat
tpl = $.pivotUtilities.aggregatorTemplates

frFmt =    nf(thousandsSep: " ", decimalSep: ",")
frFmtInt = nf(digitsAfterDecimal: 0, thousandsSep: " ", decimalSep: ",")
frFmtPct = nf(digitsAfterDecimal: 1, scaler: 100, suffix: "%", thousandsSep: " ", decimalSep: ",")

$.pivotUtilities.locales.fr = 

    localeStrings:
        renderError: "Une erreur est survenue en dessinnant le tableau croisé."
        computeError: "Une erreur est survenue en calculant le tableau croisé."
        uiRenderError: "Une erreur est survenue en dessinnant l'interface du tableau croisé."
        selectAll: "Selectionner tout"
        selectNone: "Selectionner rien"
        tooMany: "(trop de valeur à afficher)"
        filterResults: "Filtrer les resultats"
        totals: "Totaux"
        vs: "versus"
        by: "par"

    aggregators: 
        "Nombre":                       tpl.count(frFmtInt)
        "Nombre de valeurs uniques":    tpl.countUnique(frFmtInt)
        "Liste de valeurs uniques":     tpl.listUnique(",")
        "Somme":                        tpl.sum(frFmt)
        "Somme en entiers":             tpl.sum(frFmtInt)
        "Moyenne":                      tpl.average(frFmt)
        "Ratio de sommes":              tpl.sumOverSum(frFmt)
        "Borne superieure 80%":         tpl.sumOverSumBound80(true, frFmt)
        "Borne inferieure 80%":         tpl.sumOverSumBound80(false, frFmt)
        "Somme en proportion du totale":      tpl.fractionOf(tpl.sum(),   "total", frFmtPct)
        "Somme en proportion de la ligne":    tpl.fractionOf(tpl.sum(),   "row",   frFmtPct)
        "Somme en proportion de la colonne":  tpl.fractionOf(tpl.sum(),   "col",   frFmtPct)
        "Nombre en proportion du totale":     tpl.fractionOf(tpl.count(), "total", frFmtPct)
        "Nombre en proportion de la ligne":   tpl.fractionOf(tpl.count(), "row",   frFmtPct)
        "Nombre en proportion de la colonne": tpl.fractionOf(tpl.count(), "col",   frFmtPct)

    renderers:
        "Table":                          $.pivotUtilities.renderers["Table"]
        "Table avec barres":              $.pivotUtilities.renderers["Table Barchart"]
        "Carte de chaleur":               $.pivotUtilities.renderers["Heatmap"]
        "Carte de chaleur (lignes)":      $.pivotUtilities.renderers["Row Heatmap"]
        "Carte de chaleur (colonnes)":    $.pivotUtilities.renderers["Col Heatmap"]


