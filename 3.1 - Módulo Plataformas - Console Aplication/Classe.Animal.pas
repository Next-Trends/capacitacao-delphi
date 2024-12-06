unit Classe.Animal;

interface

type
  TAnimal = class
    constructor Create;
    destructor Destroy; override;

    procedure LatirPorReferencia(ALatido: String);
    procedure LatirPorVariavel(var ALatido: String);
    procedure LatirPorConstante(const ALatido: String);
    procedure LatirPorOut(ALatido: String; out ALatidoOut: String);

    function RetornarLatidoNovo: string;
    function RetornarLatidoNovoParametro(const ALatido: String): string;
  end;

implementation

{ TAnimal }

constructor TAnimal.Create;
begin
  WriteLn('Criado');
end;

destructor TAnimal.Destroy;
begin
  WriteLn('Destruido');

  inherited;
end;

procedure TAnimal.LatirPorConstante(const ALatido: String);
begin
 // ALatido := 'miau';
  WriteLn(ALatido);
end;

procedure TAnimal.LatirPorOut(ALatido: String; out ALatidoOut: String);
begin

end;

procedure TAnimal.LatirPorReferencia(ALatido: String);
begin
  ALatido := 'miau';
end;

procedure TAnimal.LatirPorVariavel(var ALatido: String);
begin
  WriteLn(ALatido);
end;

function TAnimal.RetornarLatidoNovo: string;
begin
  Result := 'Latido novo';
end;

function TAnimal.RetornarLatidoNovoParametro(const ALatido: String): string;
begin
  Result := 'Latido novo';
end;

end.
