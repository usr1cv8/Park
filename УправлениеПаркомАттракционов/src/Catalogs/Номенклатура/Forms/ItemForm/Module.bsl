

#Region Variables

#EndRegion

#Region FormEventHandlers

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)
	УправлениеВидимостьюЭлементовФормы();	 
EndProcedure

#EndRegion

#Region FormHeaderItemsEventHandlers

&AtClient
Procedure ВидНоменклатурыOnChange(Item)
	УправлениеВидимостьюЭлементовФормы();
EndProcedure

#EndRegion

#Region FormTableItemsEventHandlers //<FromTableName>

// Enter code here.

#EndRegion

#Region FormCommandsEventHandlers

// Enter code here.

#EndRegion

#Region Private

&AtServer 
Procedure УправлениеВидимостьюЭлементовФормы()
	
	ЭтоПосещениеАттракциона = (Object.ВидНоменклатуры = Enums.ВидыНоменклатуры.ПосещениеАттракциона);
	
	Элементы.ВидАттракциона.Visible = ЭтоПосещениеАттракциона;
	Элементы.КоличествоПосещений.Visible = ЭтоПосещениеАттракциона;
	
EndProcedure

#EndRegion
