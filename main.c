#include <stdio.h> 
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <GL/glut.h>


int iters = 2000;
long int p1 = 7, p2 = 7, p3 = 1;

const double windowWidth = 1000.0;
const double windowHeigth = 1000.0;
double xOffset;

void barnsley(double windowWidth, double windowHeigth, int iter);

void init2D(double r, double g, double b) {
	glClearColor(r, g, b, 0.0);  
	glMatrixMode(GL_PROJECTION);
	gluOrtho2D(0.0, windowWidth, 0.0, windowHeigth);
}

void specialKeysHandler(int key, int x, int y) {  
    switch (key) {
        case GLUT_KEY_LEFT:
            if (iters > 500)
                iters -= 500;
            glutPostRedisplay();
            break;
        case GLUT_KEY_RIGHT:
            iters += 500;
            glutPostRedisplay();
            break;
        case GLUT_KEY_UP:
            glutPostRedisplay();
            break;
        case GLUT_KEY_DOWN:
            glutPostRedisplay();
            break;
    }
} 
void keysHandler(unsigned char key, int x, int y) {  
    switch (key) {
        case 'p':
            puts("Podaj prawdopodobienstwa");
            scanf("%ld", &p1);
            scanf("%ld", &p2);
            scanf("%ld", &p3);
            glutPostRedisplay();
            break;
    }
} 

void display(void) {
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(0.0, 1.0, 0.0);
    glBegin(GL_POINTS);
    barnsley(windowWidth, windowHeigth, iters);
	glEnd();
	glFlush();
}

int main(int argc, char *argv[]) {
    xOffset = windowWidth/2.0;
    //xOffset = 0.0;
	glutInit(&argc,argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize(windowWidth, windowHeigth);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("Barnsley fern");
	init2D(0.0,0.0,0.0);
	glutDisplayFunc(display);
    glutSpecialFunc(specialKeysHandler);
    glutKeyboardFunc(keysHandler);
	glutMainLoop();
    return 0;
}
 
