FROM debian:sid-20211220

WORKDIR /root

RUN apt update && apt-get -y install curl fzf ripgrep tree git xclip python3 python3-pip nodejs npm tzdata ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config zip unzip

RUN pip3 install pynvim

RUN npm i -g neovim

RUN git clone https://github.com/neovim/neovim.git && \ 
cd neovim && \
git checkout release-0.7 && \ 
make CMAKE_BUILD_TYPE=Release && \
make install && rm -rf ../neovim

RUN mkdir lua-language-server && \
curl -L https://github.com/sumneko/lua-language-server/releases/download/3.5.6/lua-language-server-3.5.6-linux-x64.tar.gz -o ./lua-language-server/lua-language-server-3.5.6-linux-x64.tar.gz && \
cd lua-language-server && \
tar -xzf lua-language-server-3.5.6-linux-x64.tar.gz && \
rm lua-language-server-3.5.6-linux-x64.tar.gz

COPY ./lua-language-server /usr/bin/lua-language-server

RUN npm i -g bash-language-server

RUN git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim

# RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

WORKDIR /root/workspace