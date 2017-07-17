'use babel';

import {CompositeDisposable} from 'atom';
const clipboard = require('clipboard');
const co = require('co');
const OSS = require('ali-oss');

export default {


    activate(state) {
        this.subscriptions = new CompositeDisposable();

        this.subscriptions.add(atom.commands.add('atom-workspace', {
            'image-upload:paste': () => this.paste()
        }));
    },

    deactivate() {
        this.subscriptions.dispose();
    },

    serialize() {
        return {};
    },

    paste(element) {
        let editor = atom.workspace.getActiveTextEditor();
        if (!editor) {
            return;
        }
        if (editor.getPath().substr(-3) !== '.md') {
            return;
        }
        let img = clipboard.readImage();
        if (img.isEmpty()) {
            return;
        }
        let date = new Date();
        let client = new OSS({
            region: 'oss-cn-hangzhou',
            accessKeyId: '',
            accessKeySecret: '',
            bucket: 'higuaifan'
        });
        co(function* () {
            const name=date.getTime();
            let result = yield client.put('markdown/'+name+'.png', img.toPNG());
            editor.insertText("![](http://higuaifan.oss-cn-hangzhou.aliyuncs.com/markdown/" + name+ ".png)", editor);
            console.log(result);
        }).catch(function (err) {
            console.log(err);
        });
    }

};
