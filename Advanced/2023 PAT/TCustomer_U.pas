unit TCustomer_U;

interface

type TCustomer = class
  private
    fFirstName, fLastName: string;
    fDateofBirth: TDateTime;
  public
  constructor Create(firstName : string; lastName : string);



end;

implementation

{ TCustomer }

constructor TCustomer.Create(firstName, lastName: string);
begin

end;

end.
