{ lib, buildPythonPackage, fetchPypi, numpy, pandas, pathos, fn, tabulate
, funcy }:

buildPythonPackage rec {
  pname = "cadCAD";
  version = "0.3.1";

  #src = fetchPypi {
  #  inherit pname version;
  #  sha256 = "4f2a4d39e4ea601b9ab42b2db08b5918a9538c168cff1c6895ae26646f3d73b1";
  #};
  src = builtins.fetchGit {
      url = "git@github.com:BlockScience/cadCAD.git";
      ref = "master";
  };

  doCheck = false;

  buildInputs = [ ];
  checkInputs = [ ];
  propagatedBuildInputs = [ numpy pandas pathos fn tabulate funcy ];

  meta = with lib; {
    description =
      "Design, test and validate complex systems through simulation in Python";
    homepage = "https://github.com/BlockScience/cadCAD";
    license = licenses.mit;
    maintainers = with maintainers; [ benschza ];
    platforms = platforms.unix;
  };
}
