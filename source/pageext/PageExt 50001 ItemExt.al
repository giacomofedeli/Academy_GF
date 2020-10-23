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
            action("Total Calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';
                //sommare le calorie totali di ogni articolo e con una message mostrare il risultato

                trigger OnAction()
                var
                    totalcalories: Decimal;
                    Item: Record Item;
                begin
                    if Item.CalcSums("total calories") then begin


                        totalcalories := Rec."total calories";
                        Message('The sum of calories for every item is %1', totalcalories);
                    end;

                end;

            }
            action("TotCal for  Items")
            {
                ApplicationArea = All;
                Caption = 'Total Nutr infos';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';
                //sommare le calorie totali di ogni articolo e con una message mostrare il risultato

                trigger OnAction()
                var
                    total: Decimal;
                    NutrInfotemp: Record "ADM Nutritional Info" temporary;
                    NutrInfo: Record "ADM Nutritional Info";
                    EType: Enum "ADM Nutritional Info Type";
                begin
                    NutrInfo.SetRange("Nutritional Type", EType::Proteins);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    NutrInfotemp.Init();
                    NutrInfotemp.Amount := total;
                    NutrInfotemp."Nutritional type" := EType::Proteins;
                    NutrInfotemp."Item Description" := 'The sum of Proteins for every item';
                    NutrInfotemp.Insert();
                    NutrInfo.Reset();

                    NutrInfo.SetRange("Nutritional Type", EType::fats);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    NutrInfotemp.Init();
                    NutrInfotemp.Amount := total;
                    NutrInfotemp."Nutritional type" := EType::fats;
                    NutrInfotemp."Item Description" := 'The sum of Fats for every item';
                    NutrInfotemp.Insert();
                    NutrInfo.Reset();

                    NutrInfo.SetRange("Nutritional Type", EType::Sugars);
                    total := 0;
                    if NutrInfo.CalcSums("Amount") then
                        total := NutrInfo."Amount";
                    NutrInfotemp.Init();
                    NutrInfotemp.Amount := total;
                    NutrInfotemp."Nutritional type" := EType::Sugars;
                    NutrInfotemp."Item Description" := 'The sum of Sugars for every item';
                    NutrInfotemp.Insert();

                    page.RunModal(50001, NutrInfotemp);



                end;
            }


        }
    }
    var
        myInt: Integer;
}