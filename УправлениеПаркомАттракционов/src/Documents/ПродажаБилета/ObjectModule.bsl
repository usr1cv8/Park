
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Variables

#EndRegion

#Region Public

// Enter code here.

#EndRegion

#Region EventHandlers

Procedure Posting(Cancel,Mode)//{{__REGISTER_RECORD_WIZARD
	//This fragment was built by the wizard.
	//Warning! All manually made changes will be lost next time you use the wizard.

	// register АктивныеПосещения
	RegisterRecords.АктивныеПосещения.Write = True;
	Record = RegisterRecords.АктивныеПосещения.Add();
	Record.Period = Date;
	Record.RecordType = AccumulationRecordType.Receipt;
	Record.Основание = Ссылка;
	Record.Аттракцион = Аттракцион;
	Record.КоличествоПосещений = 1;

	// register Продажи
	RegisterRecords.Продажи.Write = True;
	Record = RegisterRecords.Продажи.Add();
	Record.Period = Date;
	Record.Аттракцион = Аттракцион;
	Record.Сумма = 1;

	//}}__REGISTER_RECORD_WIZARDEndProcedure
	
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
