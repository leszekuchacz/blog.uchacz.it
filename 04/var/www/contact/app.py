import falcon
import smtplib

question = "2+2=?"
answer = "4"
class IndexResource:
    def on_get(self, req, resp):
        resp.set_header('Location', '/contact.html')
        resp.status = falcon.HTTP_301

class ContactResource:
    def on_get(self, req, resp):
        response = {
            'state': (
                "200"
            ),
            'question': question
        }
        resp.media = response

    def on_post(self,req,resp):
        if req.media['answer'] != answer:
            resp.media = { 'state':  "511" , 'reason': 'bad answer'}
            resp.status = falcon.HTTP_511

        elif not req.media['name'] or not req.media['msg'] or not req.media['email']:
            resp.media = { 'state':  "512" , 'reason': 'name or msg or email is emapty'}
            resp.status = falcon.HTTP_512

        else:
            smtplib.SMTP('localhost').sendmail( 'ilovespam@uchacz.it', 'ilovespam@uchacz.it', req.media['name']+"\n "+ req.media['email']+"\n "+req.media['msg'])
            resp.media = { 'state':  "200" , 'reason': 'Validation Ok, your request added'}

application = falcon.API()
application.add_route('/api/contact', ContactResource())
application.add_route('/', IndexResource())

