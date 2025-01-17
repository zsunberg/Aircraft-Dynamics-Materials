function [V]=loadawmtl(modelname,opts)
% loadawobj load a Wavefront/Alias mtl file
% returns an array of material structures.

% Not sure what Tr is.

if nargin <1 
  disp('specify model name')
end


fid = fopen(modelname,'r');
if (fid<0)
  error(['can not open file: ' modelname]);
  return ;
end

mtlnum=0;

while ~feof(fid)
  Ln=fgets(fid);
  Ln=removespace(Ln);
  objtype=sscanf(Ln,'%s',1);
  l=length(Ln);
  if l==0  % isempty(s) ; 
%    disp(['empty' Ln]);
    continue
  end
  switch objtype
    case '#' % comment
      disp(Ln);
    case 'newmtl'
      mtlnum=mtlnum+1; % serious errors if newmtl is not the first
                       % name recognised
      V(mtlnum).name=Ln(8:end);
      %disp(Ln)
    case 'Ka' % Ambient reflectivity usually an r g b
      v=sscanf(Ln(3:end),'%f');
      V(mtlnum).Ka=v;
      %disp(Ln)
    case 'Kd' % Diffuse reflectivity usually an r g b
      V(mtlnum).Kd=sscanf(Ln(3:end),'%f');
      %disp(Ln)
    
    case 'Ks' % Specular reflectivity usually an r g b
      V(mtlnum).Ks=sscanf(Ln(3:end),'%f');
      %disp(Ln)
    case 'Ns' % Specular exponent
      V(mtlnum).Ns=sscanf(Ln(3:end),'%f');
      %disp(Ln)
    case 'd' % material disolve
      V(mtlnum).d=sscanf(Ln(2:end),'%f');
      disp(Ln)
    case 'illum' % illumination model (0-10)
      V(mtlnum).illum=sscanf(Ln(6:end),'%f');
      disp(Ln)
    case 'map_Kd' % map
      V(mtlnum).map_Kd=Ln(8:end);
      warning(sprintf('Uses a texture map: %s\n',Ln))
    case '' % 
      disp(Ln)
    otherwise 
      disp(['unprocessed-' Ln '-']); % see what has not been processed
      %#    end
  end
end

fclose(fid);

end

function Ln=removespace(Ln)
Ln=strrep(Ln,char([13 10]),''); % remove cr/lf 
Ln=strrep(Ln,char([10]),''); % remove lf 
end