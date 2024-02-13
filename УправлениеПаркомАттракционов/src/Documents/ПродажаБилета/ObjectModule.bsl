
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Variables

#EndRegion

#Region Public

// Enter code here.

#EndRegion

#Region EventHandlers

Procedure Posting(Cancel,Mode)//{{__REGISTER_RECORD_WIZARD

	СвойстваНоменклатуры = СвойстваНоменклатуры(Номенклатура);
	// register АктивныеПосещения
	RegisterRecords.АктивныеПосещения.Write = True;
	Record = RegisterRecords.АктивныеПосещения.Add();
	Record.Period = Date;
	Record.RecordType = AccumulationRecordType.Receipt;
	Record.Основание = Ссылка;
	Record.ВидАттракциона = СвойстваНоменклатуры.ВидАттракциона;
	Record.КоличествоПосещений = СвойстваНоменклатуры.КоличествоПосещений;

	// register Продажи
	RegisterRecords.Продажи.Write = True;
	Record = RegisterRecords.Продажи.Add();
	Record.Period = Date;
	Record.ВидАттракциона = СвойстваНоменклатуры.ВидАттракциона;
	Record.Сумма = 1;

	
EndProcedure

#EndRegion

#Region Internal

// Enter code here.

#EndRegion

#Region Private

Функция СвойстваНоменклатуры(Номенклатура)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "SELECT
	|	Номенклатура.ВидАттракциона,
	|	Номенклатура.КоличествоПосещений
	|FROM
	|	Catalog.Номенклатура AS Номенклатура
	|WHERE
	|	Номенклатура.Ref = &Ref";
	
	Запрос.УстановитьПараметр("Ref", Номенклатура);
	Выборка  = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Результат = Новый Структура;
	Результат.Вставить("ВидАттракциона");
	Результат.Вставить("КоличествоПосещений");
	
	ЗаполнитьЗначенияСвойств(Результат, Выборка);
	
	Возврат Результат;
	
КонецФункции


#EndRegion

#Region Initialize

#EndRegion

#EndIf
