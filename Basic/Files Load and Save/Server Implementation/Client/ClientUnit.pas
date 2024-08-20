unit ClientUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dmServer, ServerMethod;

type
  TForm1 = class(TForm)
    btnLoad: TButton;
    btnSave: TButton;
    fodFolder: TFileOpenDialog;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
    Server : TServerMethods1Client;
    procedure ReceiveStreamsFromServer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  Server := TServerMethods1Client.Create(DataModule1.SQLConnection1.DBXConnection);
  Server.LoadDirectory;
end;

procedure TForm1.ReceiveStreamsFromServer;
var
  CombinedStream: TStream;
  IndividualStream: TMemoryStream;
  StreamSize: Int64;
  ListOfStreams: TList;
begin
  CombinedStream := Server.GetStreams;
  ListOfStreams := TList.Create;

  try
    while CombinedStream.Position < CombinedStream.Size do
    begin
      // Read the size of each individual stream
      CombinedStream.Read(StreamSize, SizeOf(StreamSize));

      // Create a memory stream for the individual stream
      IndividualStream := TMemoryStream.Create;

      try
        // Copy the individual stream from the combined stream
        IndividualStream.CopyFrom(CombinedStream, StreamSize);
        IndividualStream.Position := 0;

        // Add it to the list of streams
        ListOfStreams.Add(IndividualStream);
      except
        IndividualStream.Free;
        raise; // Re-raise the exception if something goes wrong
      end;
    end;

    // Now you have all the individual streams stored in ListOfStreams
    // You can process them later as needed

    // Example: Save all streams to files

  finally
    CombinedStream.Free;
    ListOfStreams.Free; // Free the list (streams have already been freed)
  end;
end;

end.
