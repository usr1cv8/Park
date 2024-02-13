
#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region Variables

#EndRegion

#Region Public

// Enter code here.

#EndRegion

#Region EventHandlers

Procedure FillCheckProcessing(Cancel, CheckedAttributes)
	
	Если ВидНоменклатуры <> Перечисления.ВидыНоменклатуры.ПосещениеАттракциона Тогда
		НомерУдалить = CheckedAttributes.Find("КоличествоПосещений");
		Если НомерУдалить <> Неопределено Тогда
			CheckedAttributes.Delete(НомерУдалить);
		КонецЕсли;
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
