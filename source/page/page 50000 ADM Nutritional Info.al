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
                    ToolTip = 'Specifies the value of the item No. field';

                }

                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the item description field';


                }

                field("Item Description 2"; "Item Description")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the item description field';

                }

                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the Nutritional Information Type field';

                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                    StyleExpr = tmpStyle;
                    ToolTip = 'Specifies the value of the Amount field';

                }

            }


        }
        area(Factboxes)
        {

        }
    }

    /*  actions
      {
          area(Processing)
          {
              action(ActionName)
              {
                  ApplicationArea = All;
                  ToolTip = 'Executes the ActionName action';

                  trigger OnAction();
                  begin

                  end;
              }
          }
      }*/

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