#!/bin/bash

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar dependencias básicas
echo "Instalando dependencias básicas..."
sudo apt-get install -y git build-essential python3 python3-pip python3-venv

# Función para clonar e instalar herramientas desde GitHub
install_from_github() {
    local repo=$1
    local dir_name=$(basename $repo .git)
    echo "Clonando $repo..."
    git clone $repo
    cd $dir_name
    echo "Instalando $dir_name..."
    if [ -f "requirements.txt" ]; then
        pip3 install -r requirements.txt
    elif [ -f "setup.py" ]; then
        python3 setup.py install
    fi
    cd ..
}

# Instalar herramientas desde GitHub
install_from_github https://github.com/rbsec/dnscan.git
install_from_github https://github.com/guelfoweb/knock.git
install_from_github https://github.com/aboul3la/Sublist3r.git
install_from_github https://github.com/blechschmidt/massdns.git
install_from_github https://github.com/robertdavidgraham/masscan.git
install_from_github https://github.com/ChrisTruncer/EyeWitness.git
install_from_github https://github.com/maurosoria/dirsearch.git
install_from_github https://github.com/michenriksen/gitrob.git
install_from_github https://github.com/awslabs/git-secrets.git
install_from_github https://github.com/yasinS/sandcastle.git
install_from_github https://github.com/ZephrFish/GoogD0rker.git
install_from_github https://github.com/1N3/Sn1per.git
install_from_github https://github.com/evilsocket/xray.git
install_from_github https://github.com/xmendez/wfuzz.git
install_from_github https://github.com/lanjelot/patator.git
install_from_github https://github.com/DataSploit/datasploit.git
install_from_github https://github.com/ztgrace/changeme.git
install_from_github https://github.com/MobSF/Mobile-Security-Framework-MobSF.git
install_from_github https://github.com/iBotPeaches/Apktool.git
install_from_github https://github.com/BuffaloWill/oxml_xxe.git
install_from_github https://github.com/enjoiz/XXEinjector.git
install_from_github https://github.com/ticarpi/jwt_tool.git
install_from_github https://github.com/jobertabma/ground-contro.git
install_from_github https://github.com/JacobReynolds/ssrfDetector.git
install_from_github https://github.com/D35m0nd142/LFISuite.git
install_from_github https://github.com/internetwache/GitTools.git
install_from_github https://github.com/kost/dvcs-ripper.git
install_from_github https://github.com/anshumanbh/tko-subs.git
install_from_github https://github.com/nahamsec/HostileSubBruteforcer.git
install_from_github https://github.com/insp3ctre/race-the-web.git
install_from_github https://github.com/GoSecure/ysoserial.git
install_from_github https://github.com/ambionics/phpggc.git
install_from_github https://github.com/RUB-NDS/CORStest.git
install_from_github https://github.com/RetireJS/retire.js.git
install_from_github https://github.com/vulnersCom/getsploit.git
install_from_github https://github.com/1N3/Findsploit.git
install_from_github https://github.com/mazen160/bfac.git
install_from_github https://github.com/Dionach/CMSmap.git
install_from_github https://github.com/OWASP/Amass.git

# Descargar e instalar herramientas desde otras fuentes
echo "Instalando otras herramientas..."

# massdns (compilar desde fuente)
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo cp bin/massdns /usr/local/bin/
cd ..

# DirBuster (desde SourceForge)
wget https://sourceforge.net/projects/dirbuster/files/latest/download -O dirbuster.tar.gz
tar -xzvf dirbuster.tar.gz
sudo mv dirbuster*/dirbuster /usr/local/bin/
rm -rf dirbuster.tar.gz dirbuster*/

# WPScan (gemas de Ruby)
sudo apt-get install -y ruby ruby-dev libcurl4-openssl-dev
sudo gem install wpscan

# Apktool (desde SourceForge)
wget https://sourceforge.net/projects/apktool/files/latest/download -O apktool.jar
sudo mv apktool.jar /usr/local/bin/apktool.jar
sudo chmod +x /usr/local/bin/apktool.jar
echo -e "#!/bin/bash\njava -jar /usr/local/bin/apktool.jar \"\$@\"" | sudo tee /usr/local/bin/apktool
sudo chmod +x /usr/local/bin/apktool

echo "Instalación completada."
