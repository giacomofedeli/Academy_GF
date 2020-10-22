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

                }

                field("Item Description"; "Item Description")
                {
                    ApplicationArea = All;

                }

                field("Item Description 2"; "Item Description")
                {
                    ApplicationArea = All;

                }

                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;

                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;

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
}