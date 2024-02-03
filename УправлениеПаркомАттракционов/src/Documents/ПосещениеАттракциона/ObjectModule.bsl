
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

	// register АктивныеПосещения
	RegisterRecords.АктивныеПосещения.Write = True;
	Record = RegisterRecords.АктивныеПосещения.Add();
	Record.Period = Date;
	Record.RecordType = AccumulationRecordType.Expense;
	Record.Основание = Основание;
	Record.Аттракцион = Аттракцион;
	Record.КоличествоПосещений = 1;

	RegisterRecords.Write();
	
	Query = New Query;
	Query.Text = "SELECT
	|	АктивныеПосещенияBalance.Основание
	|FROM
	|	AccumulationRegister.АктивныеПосещения.Balance(, Основание = &Основание) AS АктивныеПосещенияBalance
	|WHERE
	|	АктивныеПосещенияBalance.КоличествоПосещенийBalance < 0";	

	Query.SetParameter("Основание", Основание);
	
	Если Не Query.Execute().IsEmpty() Тогда 
		
		Cancel = True;
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Text = "По одному билету можно пройти один раз";
		Сообщение.SetData(ЭтотОбъект);
		Сообщение.Field = "Основание";
		Сообщение.Message();		
	КонецЕсли;
	
	
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
