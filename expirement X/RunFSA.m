function RunFSA(path,algorithm )
%REDUCEMATDATA Summary of this function goes here
%   Detailed explanation goes here
files = dir(path);
for i = 1:length(files)   
    if ~files(i).isdir()
        try
            load([path,files(i).name]);
            disp([num2str(i),files(i).name]);
            whos('data');
            reduct = FSA(data,algorithm);
            fid = fopen('result.txt','a');
            fprintf(fid,'%s的约简结果是为:\n',files(i).name);
            fprintf(fid,'%4.0f,',reduct);
            fprintf(fid,'\n');
            fclose(fid);
        catch e
            disp(e.message);
            fid = fopen('errors.txt','a');
            fprintf(fid,'%s:%s',files(i).name,e.message);
            fprintf(fid,'\n');
            fclose(fid);
        end
    end
end

end

