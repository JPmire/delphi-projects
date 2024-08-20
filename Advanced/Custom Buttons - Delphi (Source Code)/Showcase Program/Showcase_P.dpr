program Showcase_P;

uses
  Forms,
  Showcase_U in 'Showcase_U.pas' {frmFrontPage},
  Basic_U in 'Basic_U.pas' {frmBasic},
  ImageSupport_U in 'ImageSupport_U.pas' {frmImageSupport},
  Advanced_U in 'Advanced_U.pas' {frmAdvanced};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFrontPage, frmFrontPage);
  Application.CreateForm(TfrmBasic, frmBasic);
  Application.CreateForm(TfrmImageSupport, frmImageSupport);
  Application.CreateForm(TfrmAdvanced, frmAdvanced);
  Application.Run;
end.
