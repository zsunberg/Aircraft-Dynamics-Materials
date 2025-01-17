function [p3,p4] = drawinit(S,mtl)
%% drawawobj
% Draw S with material M

if isfield(S,'f3');p3=patch('Vertices',S.v','Faces',S.f3');end
if isfield(S,'f4');p4=patch('Vertices',S.v','Faces',S.f4');end

for ii=1:length(S.umat3)
    mtlnum=S.umat3(ii);
    for jj=1:length(mtl)
        if strcmp(mtl(jj).name,S.usemtl(mtlnum-1))
            break;
        end
    end
    fvcd3(ii,:)=mtl(jj).Kd';
end
p3.FaceVertexCData=fvcd3;
p3.FaceColor='flat';
p3.EdgeColor='none';

for ii=1:length(S.umat4)
    mtlnum=S.umat4(ii);
    for jj=1:length(mtl)
        if strcmp(mtl(jj).name,S.usemtl(mtlnum-1))
            break;
        end
    end
    fvcd4(ii,:)=mtl(jj).Kd';
end
p4.FaceVertexCData=fvcd4;
p4.FaceColor='flat';
p4.EdgeColor='none'; 
end
