# Middle-Click Paste

## What is?

On linux the middle-click is surprisingly powerful, but my favorite feature is the "middle-click paste".

It's a separate copy-and-paste buffer from your usual Ctrl-C, Ctrl-V. Whenever you highlight any text, the selection is automatically copied to this buffer, and when you middle-click, it's pasted. This "I have two copy and paste buffers" thing can be extremely useful when you're used to it.

Using Ubuntu I got very used to this functionality and since I didn't have it in Windows, I had to create an alternative.

## Installation

To use this script you must download and install [AutoHotKey](https://www.autohotkey.com/). After this you just have to run the **middle-click-paste.ahk** script.

## Usage

Simply select a text, and then press the mouse wheel where you want to copy it.

## Contributing

Pull requests are welcome.

## FAQs

\- **Do I lose what I copied when selecting text?**

\+ No, the contents of the clipboard are temporarily stored in a variable and then replaced again to avoid losing the information.

\- **How can I stop the script?**

\+ To stop the script you simply have to stop the execution from the AutoHotKey application

## License

[MIT](https://choosealicense.com/licenses/mit/)

_by Gonzacap_
