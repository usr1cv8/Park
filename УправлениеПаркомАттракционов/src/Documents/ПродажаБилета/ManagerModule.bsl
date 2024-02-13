
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Public

// The procedure for filling a spreadsheet document for printing.
//
// Parameters:
//	Spreadsheet - SpreadsheetDocument - spreadsheet document to fill out and print.
//	Ref - Arbitrary - contains a reference to the object for which the print command was executed.
Procedure Билет(Spreadsheet, Ref) Export
	//{{_PRINT_WIZARD(Билет)
	Template = GetTemplate("Билет");
	Query = New Query;
	Query.Text =
		"SELECT
		|	ПродажаБилета.Number,
		|	ПродажаБилета.Date,
		|	ПродажаБилета.Номенклатура,
		|	ПродажаБилета.Номенклатура.КоличествоПосещений Как КоличествоПосещений,
		|	ПродажаБилета.СуммаДокумента
		|FROM
		|	Document.ПродажаБилета AS ПродажаБилета
		|WHERE
		|	ПродажаБилета.Ref IN (&Ref)";
	Query.Parameters.Insert("Ref", Ref);
	Selection = Query.Execute().Select();

	AreaCaption = Template.GetArea("Caption");
	Header = Template.GetArea("Header");

	Spreadsheet.Clear();

	InsertPageBreak = False;
	While Selection.Next() Do
		If InsertPageBreak Then
			Spreadsheet.PutHorizontalPageBreak();
		EndIf;
		
		ПараметрыОбласти = Новый Structure;
		ПараметрыОбласти.Insert("Date", Format(Selection.Date, "DLF=D;"));
		ПараметрыОбласти.Insert("Number", УдалитьЛидирующиеНули(Selection.Number));
		
		AreaCaption.Parameters.Fill(ПараметрыОбласти);
		
		Spreadsheet.Put(AreaCaption);

		Header.Parameters.Fill(Selection);
		Spreadsheet.Put(Header, Selection.Level());
		
		InsertPageBreak = True;
	EndDo;
	//}}
EndProcedure


#EndRegion

#Region EventHandlers

// Enter code here.

#EndRegion

#Region Internal

// Enter code here.

#EndRegion

#Region Private

Функция УдалитьЛидирующиеНули(Number)
	
	Результат = Number;
	Пока СтрНачинаетсяС(Результат, "0") Цикл
		Результат = Сред(Результат, 2);
	КонецЦикла;	
	
	Возврат Результат;
	
КонецФункции

#EndRegion

#EndIf

