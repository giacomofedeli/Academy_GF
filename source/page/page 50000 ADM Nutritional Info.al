page 50000 "ADM Nutritional Info"
{
    Caption = 'Nutritional Infos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ADM Nutritional Info";


    layout
    {
        area(Content)
        {
            repeater(group)
            {

                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;

                }

                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;


                }

                field("Item Description 2"; "Item Description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;

                }

                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;

                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;

                }

            }


        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Amount < 10 then
            tmpStyle := 'Standard';
        if (Rec.Amount >= 10) and (Rec.Amount < 100) then
            tmpStyle := 'Favorable';
        if Rec.Amount > 100 then
            tmpStyle := 'Attention';

    end;

    var
        tmpStyle: Text;

}