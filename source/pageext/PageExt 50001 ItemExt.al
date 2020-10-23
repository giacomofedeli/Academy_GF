pageextension 50001 "ADM PageExt50001" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {
            action("ADMTotal Calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';
                //sommare le calorie totali di ogni articolo e con una message mostrare il risultato

                trigger OnAction()
                var
                    Item: Record Item;
                    totalcalories: Decimal;
                begin
                    if Item.CalcSums("ADMtotal calories") then begin


                        totalcalories := Rec."ADMtotal calories";
                        Message('The sum of calories for every item is %1', totalcalories);
                    end;

                end;

            }
            action("ADMTotCal for  Items")
            {
                ApplicationArea = All;
                Caption = 'Total Nutr infos';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';
                //sommare le calorie totali di ogni articolo e con una message mostrare il risultato

                trigger OnAction()
                var
                    TempNutrInfo: Record "ADM Nutritional Info" temporary;
                    NutrInfo: Record "ADM Nutritional Info";
                    total: Decimal;
                    EType: Enum "ADM Nutritional Info Type";
                begin
                    NutrInfo.SetRange("Nutritional Type", EType::Proteins);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    TempNutrInfo.Init();
                    TempNutrInfo.Amount := total;
                    TempNutrInfo."Nutritional type" := EType::Proteins;
                    TempNutrInfo."Item Description" := 'The sum of Proteins for every item';
                    TempNutrInfo.Insert();
                    NutrInfo.Reset();

                    NutrInfo.SetRange("Nutritional Type", EType::fats);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    TempNutrInfo.Init();
                    TempNutrInfo.Amount := total;
                    TempNutrInfo."Nutritional type" := EType::fats;
                    TempNutrInfo."Item Description" := 'The sum of Fats for every item';
                    TempNutrInfo.Insert();
                    NutrInfo.Reset();

                    NutrInfo.SetRange("Nutritional Type", EType::Sugars);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    TempNutrInfo.Init();
                    TempNutrInfo.Amount := total;
                    TempNutrInfo."Nutritional type" := EType::Sugars;
                    TempNutrInfo."Item Description" := 'The sum of Sugars for every item';
                    TempNutrInfo.Insert();

                    page.RunModal(50001, TempNutrInfo);



                end;
            }


        }
    }
}