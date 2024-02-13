
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Variables

#EndRegion

#Region Public

// Enter code here.

#EndRegion

#Region EventHandlers

Procedure Posting(Cancel,Mode)
	//{{__REGISTER_RECORD_WIZARD
	//This fragment was built by the wizard.
	//Warning! All manually made changes will be lost next time you use the wizard.

	// register ЦеныНоменклатуры
	RegisterRecords.ЦеныНоменклатуры.Write = True;
	For Each CurRowЦеныНоменклатуры In ЦеныНоменклатуры Do
		Record = RegisterRecords.ЦеныНоменклатуры.Add();
		Record.Period = Date;
		Record.Номенклатура = CurRowЦеныНоменклатуры.Номенклатура;
		Record.Цена = CurRowЦеныНоменклатуры.Цена;
	EndDo;

	//}}__REGISTER_RECORD_WIZARD
EndProcedure

#EndRegion

#Region Internal

// Enter code here.

#EndRegion

#Region Private

// Enter code here.

#EndRegion

#Region Initialize

#EndRegion

#EndIf
