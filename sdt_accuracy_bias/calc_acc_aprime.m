function aprime = calc_acc_aprime(HR,FAR)
% Usage: 
%   aprimt = calc_acc_aprime(HR,FAR)
%
% CALC_ACC_APRIME returns the A' value for a given hit rate (HR) and false
% alarm rate (FAR). 
%
% Required Input:
%   HR - The hit rate for target items. 
%   FAR - The false alarm rate for lure items. 
%
% If there are an odd number (e.g., 7) of confidence bins, the hit rate 
% (HR) and false alarm rate (FAR) do not include the middle point. For 
% example the HR and FAR are based on the 7, 6, and 5 ratings if using
% a 7-point rating scale.
%
% Authored by: Joshua D. Koen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The ROC Toolbox is the proprietary property of The Regents of the       
% University of California (The Regents.)                                
%
% Copyright © 2014 The Regents of the University of California, Davis
% campus. All Rights Reserved.   
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted by nonprofit, research institutions for
% research use only, provided that the following conditions are met:  
%
% 	Redistributions of source code must retain the above copyright 
% notice, this list of conditions and the following disclaimer.  
%
% 	Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in the
% documentation and/or other materials provided with the distribution.   
%
% 	The name of The Regents may not be used to endorse or promote 
% products derived from this software without specific prior written
% permission.   
%
% The end-user understands that the program was developed for research
% purposes and is advised not to rely exclusively on the program for any
% reason.  
%
% THE SOFTWARE PROVIDED IS ON AN "AS IS" BASIS, AND THE REGENTS HAVE NO
% OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
% MODIFICATIONS. THE REGENTS SPECIFICALLY DISCLAIM ANY EXPRESS OR IMPLIED
% WARRANTIES, INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE REGENTS BE LIABLE TO ANY PARTY FOR DIRECT,
% INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES,
% INCLUDING BUT NOT LIMITED TO  PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES, LOSS OF USE, DATA OR PROFITS, OR BUSINESS INTERRUPTION, 
% HOWEVER CAUSED AND UNDER ANY THEORY OF LIABILITY WHETHER IN CONTRACT,
% STRICT LIABILITY OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
% ANY WAY OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF
% ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.             
%
% If you do not agree to these terms, do not download or use the software.
% This license may be modified only in a writing signed by authorized
% signatory of both parties.  
%
% For commercial license information please contact
% copyright@ucdavis.edu. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check for errors in the number of input arguments. 
if nargin<2
    error('Not enough inputs given to the function.')
end

% Check for input mismatch in HR and FAR vectors.
if length(HR)~=length(FAR)
    error('Length of HR and FAR vectors or inconsistent.')
end

%Preallocate variables
aprime=zeros(length(HR),1);

% Calculate A'
for a=1:length(HR)
    if HR(a)>FAR(a)
        aprime(a)=.5+((HR(a)-FAR(a))*(1+HR(a)-FAR(a)))/(4*HR(a)*(1-FAR(a)));
    else
        aprime(a)=.5+((FAR(a)-HR(a))*(1+FAR(a)-HR(a)))/(4*FAR(a)*(1-HR(a)));
    end
end

end