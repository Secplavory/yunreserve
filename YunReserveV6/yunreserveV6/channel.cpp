#include "channel.h"

channel::channel(QObject *parent) : QObject(parent)
{
}

void channel::setVisible(QString handler, QString box_ch){
    state = handler;
    if(box_ch=="99"){
        emit ch01Changed();
    }
    switch (box_ch.toInt()) {
    case 1:
        emit ch01Changed();
        break;
    }
}
