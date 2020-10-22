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
        }
    }
    var
        myInt: Integer;
}