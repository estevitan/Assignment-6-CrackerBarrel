
import java.util.*;

public class Homework8
{
	//function for creating the size of the diamond
	// we begin with 5 rows, which creates 15 nodes
	final public static int SIZE = 5;
	final public static boolean verify = false;
	final public static int row = 4;
	final public static int column = 2;
	public static HashMap<Integer,Integer> jump;

	// Possible jump directions.
	final public static int[] DX = {-1,-1,0,0,1,1};
	final public static int[] DY = {-1,0,-1,1,0,1};

	public static void main(String[] args)
	{

		// function for initializing board
		int start = initBoard(0,1);

		// the "start" variable indicates where we begin solving
		// the cracker barrel puzzle
		jump = new HashMap<Integer,Integer>();
		jump.put(start, 0);

		// We will be utilizing a queue and our
		// "start" variable
		// first in, first out
		LinkedList<Integer> q = new LinkedList<Integer>();
		q.offer(start);

		// The queue allows us to utilize a breadth-first-search
		// this function runs the solver while the size of the queue,
		// equal to the nodes present, is not zero
		while (q.size() > 0)
		{

			// Get next move.
			int peg = q.poll();
			int pegDist = jump.get(peg);

			// Get all possible next moves.
			ArrayList<Integer> nextList = getNextPos(peg);

			for (int i=0; i<nextList.size(); i++)
			{
				if (!jump.containsKey(nextList.get(i)))
				{
					jump.put(nextList.get(i), pegDist+1);
					q.offer(nextList.get(i));
				}
			}
			if (nextList.size() == 0) print(peg);
		}

		// Function for printing our final puzzle board
		if (verify)
		{
			for (Integer board: jump.keySet())
				print(board);
		}
	}

	// The mask continues with pegs in all locations except our origin
	// and the position of "hopped" pegs
	// The function prints the full puzzle board and indicates the pegs
	// that we have removed each turn.
	public static int initBoard(int rowPos, int colPos)
	{

		int mask = 0;
		for (int i=0; i<SIZE; i++)
			for (int j=0; j<=i; j++)
				mask = mask | (1<<(SIZE*i+j));
		return mask - (1<<(SIZE*rowPos+colPos));
	}

	public static ArrayList<Integer> getNextPos(int mask)
	{

		ArrayList<Integer> pos = new ArrayList<Integer>();

		// Function for calculating each possible movement
		// in each row, column
		for (int r =0; r<SIZE; r++)
		{
			for (int c=0; c<=SIZE; c++)
			{
				for (int dir=0; dir<DX.length; dir++)
				{

					// Ending square is out of bounds.
					if (!inbounds(r+2*DX[dir], c+2*DY[dir])) continue;

					// A move is valid only if the first two holes have pegs and the destination doesn't.
					if (on(mask, SIZE*r+c)
					&& on(mask, SIZE*(r+DX[dir]) + c + DY[dir])
					&& !on(mask, SIZE*(r+2*DX[dir]) + c + 2*DY[dir]))
					{
						int newpos = apply(mask, dir, r, c);
						pos.add(newpos);
					}
				}
			}
		}
		return pos;
	}

	// Prints the board position corresponding to mask with an extra blank line at the end.
	public static void print(int mask) {

		// This next loops search each position for possible moves
		// and define the shape of the diamond
		for (int i=0; i<SIZE; i++){
			for (int j=0; j<SIZE-1-i; j++) System.out.print(" ");

			for (int j=0; j<=i; j++) {
				if (on(mask, SIZE*i+j)) System.out.print("X ");
				else					System.out.print("_ ");
			}
			System.out.println();
		}
		System.out.println();
	}

	// the "apply" function applies the changes we have made to
	// the puzzle board, slowly removing each peg that has been skipped
	public static int apply(int mask, int dir, int r, int c) {

		// Get the bit location of the starting hole
		int start = SIZE*r + c;
		int mid = SIZE*(r+DX[dir]) + c + DY[dir];
		int end = SIZE*(r+2*DX[dir]) + c + 2*DY[dir];

		// We get rid of the start and midding and add in the end to apply a jump.
		return mask - (1<<start) - (1<<mid) + (1<<end);
	}
	public static boolean on(int mask, int bit) {
		return (mask & (1<<bit)) != 0;
	}

	public static boolean inbounds(int myr, int myc) {
		return myr >= 0 && myr < SIZE && myc >= 0 && myc <= myr;
	}
}
