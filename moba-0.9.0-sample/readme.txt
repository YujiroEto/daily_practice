
������

���Υ���ץ�ˤϡ�������ǽ�����äƤ��ޤ���

�������Ͽ
����������ơ����������������
����Ū�ڡ���

���Ȥ���

MobaSiF ���󥹥ȡ���塢�����Ǻ�ʬ�򤢤ƤƤ���������

rsync -avb --suffix=.orig diff/ $MOBA_DIR/

cd $MOBA_DIR/conf
find . -type f | xargs sed -i s:###MOBA_DIR###:$MOBA_DIR:g;
find . -type f | xargs sed -i s/###PROJ_NAME###/{DB����̾}/g;
find . -type f | xargs sed -i s/###USER###/$USER/g;
find . -type f | xargs sed -i s/###GROUP###/{�¹�GROUP}/g;
find . -type f | xargs sed -i s/###DOMAIN###/{web �����ФΥɥᥤ��}/g;

cat createdb.sql | mysql -uroot

��DB �� drop database ���Ƥ���ƺ��������Τ���դ��Ƥ���������

compile_template --refresh
