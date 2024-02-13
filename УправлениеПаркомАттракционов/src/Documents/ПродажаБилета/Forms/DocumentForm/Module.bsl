
#Region Variables

#EndRegion

#Region FormEventHandlers

&AtClient
Procedure НоменклатураOnChange(Item)
	
	Object.СуммаДокумента = ЦенаНоменклатуры(Object.Номенклатура, Object.Date);
	
EndProcedure

#EndRegion

#Region FormHeaderItemsEventHandlers

// Enter code here.

#EndRegion

#Region FormTableItemsEventHandlers //<FromTableName>

// Enter code here.

#EndRegion

#Region FormCommandsEventHandlers

// Enter code here.

#EndRegion

#Region Private

&НаСервереБезКонтекста
Функция ЦенаНоменклатуры(Знач Номенклатура, Знач Период)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "SELECT
	|	ЦеныНоменклатурыSliceLast.Цена
	|FROM
	|	InformationRegister.ЦеныНоменклатуры.SliceLast(&Период, Номенклатура = &Номенклатура) AS ЦеныНоменклатурыSliceLast";
	
	Запрос.УстановитьПараметр("Период", Период);
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	
	Выборка = Запрос.Execute().Select();
	
	Если Выборка.Next() Тогда
		Возврат Выборка.Цена;
	КонецЕсли;
	
	Возврат 0;
	
КонецФункции


#EndRegion
