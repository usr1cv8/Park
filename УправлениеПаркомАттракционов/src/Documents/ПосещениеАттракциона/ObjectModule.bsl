
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Variables

#EndRegion

#Region Public

// Enter code here.

#EndRegion

#Region EventHandlers

Procedure Posting(Cancel,Mode)

	// register АктивныеПосещения
	RegisterRecords.АктивныеПосещения.Write = True;
	RegisterRecords.Write();
	
	Query = New Query;
	Query.Text =
		"SELECT
		|	АктивныеПосещенияBalance.ВидАттракциона,
		|	АктивныеПосещенияBalance.КоличествоПосещенийBalance
		|FROM
		|	AccumulationRegister.АктивныеПосещения.Balance(, Основание = &Основание) AS АктивныеПосещенияBalance";
	
	Query.SetParameter("Основание", Основание);
	
	QueryResult = Query.Execute();
	
	SelectionDetailRecords = QueryResult.Select();
	
	VisitsLeft = 0;
	Subscriber = Undefined;
	
	If SelectionDetailRecords.Next() Then

		VisitsLeft =  SelectionDetailRecords.КоличествоПосещенийBalance;
		Subscriber = SelectionDetailRecords.ВидАттракциона;			

	EndIf;
	
	If VisitsLeft < 1 Then 
		
		Cancel = True;
		
		UMessage = Новый UserMessage;
		UMessage.Text = "There are no visits left on the ticket";
		UMessage.SetData(ThisObject);
		UMessage.Field = "Основание";
		UMessage.Message();		
		
	EndIf;
	
	TypeDocAttraction = ВидАттракциона(Аттракцион);
	
	If ValueIsFilled(Subscriber) 
	And TypeDocAttraction <> Subscriber Then 
		
		Cancel = True;
		
		UMessage = Новый UserMessage;
		UMessage.Text = "Ticket is not valid for this attraction";
		UMessage.SetData(ThisObject);
		UMessage.Field = "Основание";
		UMessage.Message();		
		
	EndIf;
	
	If Cancel Then
		Return;
	EndIf;
		
	RegisterRecords.АктивныеПосещения.Write = True;
	Record = RegisterRecords.АктивныеПосещения.Add();
	Record.Period = Date;
	Record.RecordType = AccumulationRecordType.Expense;
	Record.Основание = Основание;
	Record.ВидАттракциона = Subscriber;
	Record.КоличествоПосещений = 1;

EndProcedure

#EndRegion

#Region Internal

// Enter code here.

#EndRegion

#Region Private

Функция ВидАттракциона(Аттракцион)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "SELECT
	|	Аттракционы.ВидАттракциона
	|FROM
	|	Catalog.Аттракционы AS Аттракционы
	|WHERE
	|	Аттракционы.Ref = &Ref";
	
	Запрос.УстановитьПараметр("Ref", Аттракцион);
	Выборка  = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Возврат Выборка.ВидАттракциона;
	
КонецФункции


#EndRegion

#Region Initialize

#EndRegion

#EndIf
